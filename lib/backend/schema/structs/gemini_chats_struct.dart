// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeminiChatsStruct extends BaseStruct {
  GeminiChatsStruct({
    String? sender,
    String? content,
  })  : _sender = sender,
        _content = content;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;

  bool hasSender() => _sender != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static GeminiChatsStruct fromMap(Map<String, dynamic> data) =>
      GeminiChatsStruct(
        sender: data['sender'] as String?,
        content: data['content'] as String?,
      );

  static GeminiChatsStruct? maybeFromMap(dynamic data) => data is Map
      ? GeminiChatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sender': _sender,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static GeminiChatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeminiChatsStruct(
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GeminiChatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeminiChatsStruct &&
        sender == other.sender &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([sender, content]);
}

GeminiChatsStruct createGeminiChatsStruct({
  String? sender,
  String? content,
}) =>
    GeminiChatsStruct(
      sender: sender,
      content: content,
    );
