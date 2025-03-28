class Note {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime modifiedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.modifiedAt,
  });

  // Create a copy of the note with modified properties
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
      modifiedAt: DateTime.parse(map['modified_at']),
    );
  }
}