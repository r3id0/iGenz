import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_currentUser') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_currentUser') ?? '{}';
          _currentUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _systemMessage =
          await secureStorage.getString('ff_systemMessage') ?? _systemMessage;
    });
    await _safeInitAsync(() async {
      _chats = (await secureStorage.getStringList('ff_chats'))
              ?.map((x) {
                try {
                  return ChatStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _chats;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _currentUser = UserStruct();
  UserStruct get currentUser => _currentUser;
  set currentUser(UserStruct value) {
    _currentUser = value;
    secureStorage.setString('ff_currentUser', value.serialize());
  }

  void deleteCurrentUser() {
    secureStorage.delete(key: 'ff_currentUser');
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_currentUser);
    secureStorage.setString('ff_currentUser', _currentUser.serialize());
  }

  String _systemMessage = 'You and the user are happy-go-lucky gen-z';
  String get systemMessage => _systemMessage;
  set systemMessage(String value) {
    _systemMessage = value;
    secureStorage.setString('ff_systemMessage', value);
  }

  void deleteSystemMessage() {
    secureStorage.delete(key: 'ff_systemMessage');
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  List<ChatStruct> _chats = [];
  List<ChatStruct> get chats => _chats;
  set chats(List<ChatStruct> value) {
    _chats = value;
    secureStorage.setStringList(
        'ff_chats', value.map((x) => x.serialize()).toList());
  }

  void deleteChats() {
    secureStorage.delete(key: 'ff_chats');
  }

  void addToChats(ChatStruct value) {
    chats.add(value);
    secureStorage.setStringList(
        'ff_chats', _chats.map((x) => x.serialize()).toList());
  }

  void removeFromChats(ChatStruct value) {
    chats.remove(value);
    secureStorage.setStringList(
        'ff_chats', _chats.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChats(int index) {
    chats.removeAt(index);
    secureStorage.setStringList(
        'ff_chats', _chats.map((x) => x.serialize()).toList());
  }

  void updateChatsAtIndex(
    int index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    chats[index] = updateFn(_chats[index]);
    secureStorage.setStringList(
        'ff_chats', _chats.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChats(int index, ChatStruct value) {
    chats.insert(index, value);
    secureStorage.setStringList(
        'ff_chats', _chats.map((x) => x.serialize()).toList());
  }

  final _feedManager = FutureRequestManager<List<PostsRow>>();
  Future<List<PostsRow>> feed({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRow>> Function() requestFn,
  }) =>
      _feedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFeedCache() => _feedManager.clear();
  void clearFeedCacheKey(String? uniqueKey) =>
      _feedManager.clearRequest(uniqueKey);

  final _selectedUserPostsManager = FutureRequestManager<List<PostsRow>>();
  Future<List<PostsRow>> selectedUserPosts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRow>> Function() requestFn,
  }) =>
      _selectedUserPostsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSelectedUserPostsCache() => _selectedUserPostsManager.clear();
  void clearSelectedUserPostsCacheKey(String? uniqueKey) =>
      _selectedUserPostsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
