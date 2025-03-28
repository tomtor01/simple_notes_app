import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/note_repository.dart';
import '../models/note.dart';
import '../providers/note_notifier.dart';

class NotePage extends ConsumerStatefulWidget {
  final Note note;

  const NotePage({super.key, required this.note});

  @override
  ConsumerState<NotePage> createState() => _NotePageState();
}

class _NotePageState extends ConsumerState<NotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _updateNote() async {
    final repository = ref.read(notesRepositoryProvider);
    final updatedNote = Note(
      id: widget.note.id,
      title: _titleController.text,
      content: _contentController.text,
      createdAt: widget.note.createdAt, // Keep original creation date
      modifiedAt: DateTime.now(), // Update modified date
    );

    await repository.updateNote(updatedNote);
    ref.invalidate(notesProvider); // Refresh notes list in HomePage
    Navigator.pop(context); // Go back to HomePage
  }

  Future<void> _deleteNote() async {
    final repository = ref.read(notesRepositoryProvider);
    await repository.deleteNote(widget.note.id as int);
    ref.invalidate(notesProvider); // Refresh notes list in HomePage
    Navigator.pop(context); // Go back to HomePage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: _deleteNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Content"),
                maxLines: null, // Allow multiline input
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateNote,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
