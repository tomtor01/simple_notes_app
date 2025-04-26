import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  DateTime modifiedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'].toString(),
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
      modifiedAt: DateTime.parse(map['modified_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'modified_at': modifiedAt.toIso8601String(),
    };
  }
}