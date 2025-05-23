import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_notes_app/features/note/presentation/settings_page.dart';
import 'auth_gate.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/widgets/note_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/providers/note_notifier.dart';
import '../data/models/note.dart';
import 'add_note_page.dart';
import 'edit_note_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // ładuje notatki przy inicjalizacji
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notesProvider.notifier).loadNotes();
    });

    // Nasłuchuje zmian w stanie uwierzytelnienia
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // Odświeża notatki przy zmianie stanu logowania
      if (mounted) {
        ref.read(notesProvider.notifier).loadNotes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final windowSizeClass = ResponsiveLayout.getWindowSizeClass(context);
    final notesState = ref.watch(notesProvider);
    final isUserLoggedIn = FirebaseAuth.instance.currentUser != null;

    return AdaptiveScaffold(
      title: isUserLoggedIn ? 'Notatki (Cloud)' : 'Notatki (Lokalne)',
      actions: [
        IconButton(
          icon: Icon(isUserLoggedIn ? Icons.person : Icons.login),
          onPressed: () {
            if (isUserLoggedIn) {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('Twój profil'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              ).then((_) {
                ref.read(notesProvider.notifier).loadNotes();
              });
            } else {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AuthGate(initialShowLoginScreen: true),
                  ),
                );
              });
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            );
          },
        ),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNotePage()),
          ).then((_) {
            // Odśwież notatki po powrocie z ekranu dodawania
            ref.read(notesProvider.notifier).loadNotes();
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Nowa notatka'),
      ),
      body: _buildBody(context, windowSizeClass, notesState),
    );
  }

  Widget _buildBody(
      BuildContext context,
      WindowSizeClass windowSizeClass,
      AsyncValue<List<Note>> notesState,
      ) {
    return notesState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Błąd: $error'),
            ElevatedButton(
              onPressed: () => ref.read(notesProvider.notifier).loadNotes(),
              child: const Text('Spróbuj ponownie'),
            ),
          ],
        ),
      ),
      data: (notes) {
        if (notes.isEmpty) {
          return const Center(child: Text('Brak notatek.'));
        }
        return Padding(
          padding: ResponsiveLayout.getMarginForWindowSize(windowSizeClass),
          child: LayoutBuilder(
            builder: (context, constraints) => _buildGridLayout(notes, windowSizeClass),
          ),
        );
      },
    );
  }

  Widget _buildGridLayout(List<Note> notes, WindowSizeClass windowSizeClass) {
    int columns =
    windowSizeClass == WindowSizeClass.compact
        ? 1
        : windowSizeClass == WindowSizeClass.medium
        ? 2
        : windowSizeClass == WindowSizeClass.large
        ? 3
        : 4;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) => _buildGridItem(context, notes[index]),
    );
  }

  Widget _buildGridItem(BuildContext context, Note note) {
    return NoteCard(
      title: note.title,
      content: note.content,
      modified: note.modifiedAt,
      destination: NotePage(note: note),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NotePage(note: note)),
        ).then((_) {
          // Odśwież notatki po powrocie z ekranu edycji
          ref.read(notesProvider.notifier).loadNotes();
        });
      },
    );
  }
}
