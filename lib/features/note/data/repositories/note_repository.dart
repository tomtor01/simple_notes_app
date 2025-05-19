import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NotesRepository {
  static const String _databaseName = 'notes.db';
  static const int _databaseVersion = 1;
  static const String _tableName = 'notes';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  // Pobiera ID aktualnego użytkownika
  String? get userId => _auth.currentUser?.uid;

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
    if (isUserLoggedIn) {
      // Pobiera notatki z Firestore dla zalogowanego użytkownika
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Note(
          id: doc.id,
          title: data['title'],
          content: data['content'],
          createdAt: (data['created_at'] as Timestamp).toDate(),
          modifiedAt: (data['modified_at'] as Timestamp).toDate(),
        );
      }).toList();
    } else {
      // Pobiera notatki z lokalnej bazy danych
      final db = await _db;
      final maps = await db.query(_tableName);
      return maps.map((m) => Note.fromMap(m)).toList();
    }
  }

  Future<void> addNote(Note note) async {
    if (isUserLoggedIn) {
      // Dodaje notatkę do Firestore
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(note.id)
          .set({
        'title': note.title,
        'content': note.content,
        'created_at': Timestamp.fromDate(note.createdAt),
        'modified_at': Timestamp.fromDate(note.modifiedAt),
      });
    } else {
      // Dodaje notatkę do lokalnej bazy danych
      final db = await _db;
      await db.insert(
        _tableName,
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> updateNote(Note note) async {
    if (isUserLoggedIn) {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(note.id)
          .update({
        'title': note.title,
        'content': note.content,
        'modified_at': Timestamp.fromDate(note.modifiedAt),
      });
    } else {
      final db = await _db;
      await db.update(
        _tableName,
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    }
  }

  Future<void> deleteNote(String id) async {
    if (isUserLoggedIn) {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(id)
          .delete();
    } else {
      final db = await _db;
      await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  // Migracja danych z lokalnej bazy do Firestore po zalogowaniu
  Future<void> migrateLocalToFirestore() async {
    if (!isUserLoggedIn) return;

    final db = await _db;
    final maps = await db.query(_tableName);
    final notes = maps.map((m) => Note.fromMap(m)).toList();

    final batch = _firestore.batch();

    for (final note in notes) {
      final docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(note.id);

      batch.set(docRef, {
        'title': note.title,
        'content': note.content,
        'created_at': Timestamp.fromDate(note.createdAt),
        'modified_at': Timestamp.fromDate(note.modifiedAt),
      });
    }

    await batch.commit();
  }
}