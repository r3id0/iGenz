import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String get profilePhoto => getField<String>('profile_photo')!;
  set profilePhoto(String value) => setField<String>('profile_photo', value);

  String get coverPhoto => getField<String>('cover_photo')!;
  set coverPhoto(String value) => setField<String>('cover_photo', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  String? get contactNumber => getField<String>('contact_number');
  set contactNumber(String? value) => setField<String>('contact_number', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);
}
