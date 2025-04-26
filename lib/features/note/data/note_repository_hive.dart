import 'package:hive/hive.dart';
import '../models/note.dart';

class NotesRepositoryHive {
  static const String boxName = 'notesBox';

  Future<Box<Note>> get _box async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(NoteAdapter());
    }
    return await Hive.openBox<Note>(boxName);
  }

  Future<List<Note>> fetchNotes() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> addNote(Note note) async {
    final box = await _box;
    await box.put(note.id, note);
  }

  Future<void> updateNote(Note note) async {
    final box = await _box;
    await box.put(note.id, note);
  }

  Future<void> deleteNote(String id) async {
    final box = await _box;
    await box.delete(id);
  }
}