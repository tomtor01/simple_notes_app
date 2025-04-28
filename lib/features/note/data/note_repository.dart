import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class NotesRepository {
  static const String _databaseName = 'notes.db';
  static const int _databaseVersion = 1;
  static const String _tableName = 'notes';

  Future<Database> get _db async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            title TEXT,
            content TEXT,
            created_at TEXT,
            modified_at TEXT
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  Future<List<Note>> fetchNotes() async {
    final db = await _db;
    final maps = await db.query(_tableName);
    return maps.map((m) => Note.fromMap(m)).toList();
  }

  Future<void> addNote(Note note) async {
    final db = await _db;
    await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateNote(Note note) async {
    final db = await _db;
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(String id) async {
    final db = await _db;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}