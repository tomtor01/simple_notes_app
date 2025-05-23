import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/note.dart';
import '../../data/repositories/note_repository.dart';

final notesRepositoryProvider = Provider((ref) => NotesRepository());

final notesProvider = AsyncNotifierProvider<NotesNotifier, List<Note>>(() {
  return NotesNotifier();
});

class NotesNotifier extends AsyncNotifier<List<Note>> {
  late final NotesRepository _repository = ref.read(notesRepositoryProvider);

  @override
  Future<List<Note>> build() async {
    return _repository.fetchNotes();
  }

  Future<void> loadNotes() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.fetchNotes());
  }

  Future<void> addNote(Note note) async {
    state = const AsyncLoading();
    await _repository.addNote(note);
    state = await AsyncValue.guard(() => _repository.fetchNotes());
  }

  Future<void> updateNote(Note note) async {
    state = const AsyncLoading();
    await _repository.updateNote(note);
    state = await AsyncValue.guard(() => _repository.fetchNotes());
  }

  Future<void> deleteNote(String id) async {
    state = const AsyncLoading();
    await _repository.deleteNote(id);
    state = await AsyncValue.guard(() => _repository.fetchNotes());
  }
}

