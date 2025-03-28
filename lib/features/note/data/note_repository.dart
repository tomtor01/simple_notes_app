import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class NotesRepository {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        createdAt INTEGER
      )
    ''');
  }

  Future<List<Note>> fetchNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(maps[i]['createdAt']),
        modifiedAt: DateTime.now(),
      );
    });
  }

  Future<int> addNote(Note note) async {
    final db = await database;
    return await db.insert('notes', {
      'title': note.title,
      'content': note.content,
      'createdAt': note.createdAt.millisecondsSinceEpoch,
    });
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db.update(
      'notes',
      {
        'title': note.title,
        'content': note.content,
        'createdAt': note.createdAt.millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

