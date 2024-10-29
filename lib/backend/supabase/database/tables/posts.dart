import '../database.dart';

class PostsTable extends SupabaseTable<PostsRow> {
  @override
  String get tableName => 'posts';

  @override
  PostsRow createRow(Map<String, dynamic> data) => PostsRow(data);
}

class PostsRow extends SupabaseDataRow {
  PostsRow(super.data);

  @override
  SupabaseTable get table => PostsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get caption => getField<String>('caption');
  set caption(String? value) => setField<String>('caption', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get authorUsername => getField<String>('author_username');
  set authorUsername(String? value) =>
      setField<String>('author_username', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  List<String> get likes => getListField<String>('likes');
  set likes(List<String>? value) => setListField<String>('likes', value);
}
