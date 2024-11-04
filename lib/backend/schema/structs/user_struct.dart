// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    String? username,
    int? age,
    String? id,
    String? userProfilePhoto,
    String? bio,
    DateTime? birthdate,
    String? email,
    String? contactNumber,
  })  : _firstName = firstName,
        _lastName = lastName,
        _username = username,
        _age = age,
        _id = id,
        _userProfilePhoto = userProfilePhoto,
        _bio = bio,
        _birthdate = birthdate,
        _email = email,
        _contactNumber = contactNumber;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "userProfilePhoto" field.
  String? _userProfilePhoto;
  String get userProfilePhoto => _userProfilePhoto ?? '';
  set userProfilePhoto(String? val) => _userProfilePhoto = val;

  bool hasUserProfilePhoto() => _userProfilePhoto != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  set birthdate(DateTime? val) => _birthdate = val;

  bool hasBirthdate() => _birthdate != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "contact_number" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  set contactNumber(String? val) => _contactNumber = val;

  bool hasContactNumber() => _contactNumber != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        username: data['username'] as String?,
        age: castToType<int>(data['age']),
        id: data['id'] as String?,
        userProfilePhoto: data['userProfilePhoto'] as String?,
        bio: data['bio'] as String?,
        birthdate: data['birthdate'] as DateTime?,
        email: data['email'] as String?,
        contactNumber: data['contact_number'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'username': _username,
        'age': _age,
        'id': _id,
        'userProfilePhoto': _userProfilePhoto,
        'bio': _bio,
        'birthdate': _birthdate,
        'email': _email,
        'contact_number': _contactNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userProfilePhoto': serializeParam(
          _userProfilePhoto,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.DateTime,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'contact_number': serializeParam(
          _contactNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userProfilePhoto: deserializeParam(
          data['userProfilePhoto'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.DateTime,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        contactNumber: deserializeParam(
          data['contact_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        username == other.username &&
        age == other.age &&
        id == other.id &&
        userProfilePhoto == other.userProfilePhoto &&
        bio == other.bio &&
        birthdate == other.birthdate &&
        email == other.email &&
        contactNumber == other.contactNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        username,
        age,
        id,
        userProfilePhoto,
        bio,
        birthdate,
        email,
        contactNumber
      ]);
}

UserStruct createUserStruct({
  String? firstName,
  String? lastName,
  String? username,
  int? age,
  String? id,
  String? userProfilePhoto,
  String? bio,
  DateTime? birthdate,
  String? email,
  String? contactNumber,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      username: username,
      age: age,
      id: id,
      userProfilePhoto: userProfilePhoto,
      bio: bio,
      birthdate: birthdate,
      email: email,
      contactNumber: contactNumber,
    );
