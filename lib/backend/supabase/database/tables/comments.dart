import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(super.data);

  @override
  SupabaseTable get table => CommentsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get postID => getField<String>('postID')!;
  set postID(String value) => setField<String>('postID', value);

  String get authorID => getField<String>('authorID')!;
  set authorID(String value) => setField<String>('authorID', value);

  String? get authorName => getField<String>('authorName');
  set authorName(String? value) => setField<String>('authorName', value);

  String? get authorUsername => getField<String>('authorUsername');
  set authorUsername(String? value) =>
      setField<String>('authorUsername', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  List<String> get likes => getListField<String>('likes');
  set likes(List<String>? value) => setListField<String>('likes', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
