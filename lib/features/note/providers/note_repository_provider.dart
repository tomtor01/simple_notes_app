import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/note_repository_hive.dart';

final notesRepositoryProvider = Provider<dynamic>((ref) {
  return NotesRepositoryHive();
});
