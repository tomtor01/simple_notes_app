import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/providers/note_notifier.dart';
import '../data/models/note.dart';

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
      title:
          _titleController.text.trim().isEmpty
              ? 'Notatka bez tytułu'
              : _titleController.text,
      content: _contentController.text,
      createdAt: widget.note.createdAt,
      modifiedAt: DateTime.now(),
    );

    await repository.updateNote(updatedNote);
    ref.invalidate(notesProvider); // odświeżenie listy notatek w HomePage
    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<void> _deleteNote() async {
    final repository = ref.read(notesRepositoryProvider);
    await repository.deleteNote(widget.note.id);
    ref.invalidate(notesProvider);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edytuj notatkę"),
        scrolledUnderElevation: 0,
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
              decoration: const InputDecoration(labelText: "Tytuł"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Treść"),
                maxLines: null, // pozwala na multiline
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _updateNote,
              child: const Text("Zapisz notatkę"),
            ),
          ],
        ),
      ),
    );
  }
}
