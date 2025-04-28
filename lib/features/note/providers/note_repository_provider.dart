import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/note_repository.dart';

final notesRepositoryProvider = Provider((ref) {
  return NotesRepository();
});
