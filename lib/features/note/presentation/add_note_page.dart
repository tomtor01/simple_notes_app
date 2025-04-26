import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../providers/note_notifier.dart';
import 'package:uuid/uuid.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final repository = ref.read(notesRepositoryProvider);
    final now = DateTime.now();
    final note = Note(
      id: const Uuid().v4(),
      title: _titleController.text,
      content: _contentController.text,
      createdAt: now,
      modifiedAt: now,
    );
    await repository.addNote(note);
    ref.invalidate(notesProvider);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nowa notatka')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Tytuł'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Treść'),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _saveNote,
              child: const Text('Zapisz notatkę'),
            ),
          ],
        ),
      ),
    );
  }
}
