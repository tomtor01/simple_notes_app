import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Generate the provider code
part 'async_notifier_annotated_screen.g.dart';

// Simulated API response delay
Future<List<String>> fetchTodos() async {
  await Future.delayed(const Duration(seconds: 2));
  return ['Learn Riverpod', 'Build awesome apps', 'Write clean code', 'Test thoroughly', 'Deploy to production'];
}

// Define an AsyncNotifier using annotations
@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  Future<List<String>> build() async {
    // Initial fetch of todos
    return fetchTodos();
  }

  Future<void> addTodo(String todo) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Update state with new todo
    state = AsyncValue.data([...state.value ?? [], todo]);
  }

  Future<void> removeTodo(String todo) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Update state without the removed todo
    state = AsyncValue.data(
      (state.value ?? []).where((t) => t != todo).toList(),
    );
  }

  Future<void> refresh() async {
    // Set loading state
    state = const AsyncValue.loading();

    try {
      // Fetch fresh data
      final todos = await fetchTodos();
      state = AsyncValue.data(todos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

class AsyncNotifierAnnotatedScreen extends ConsumerWidget {
  const AsyncNotifierAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the async value
    final AsyncValue<List<String>> todos = ref.watch(todosNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncNotifier (Adnotowany)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład AsyncNotifier (z Adnotacjami)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje jak używać AsyncNotifier w Riverpod '
              'z wykorzystaniem nowej składni adnotacji. AsyncNotifier jest '
              'używany do zarządzania asynchronicznym stanem.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: todos.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Text('Error: $error'),
                ),
                data: (todoList) => Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          final todo = todoList[index];
                          return Card(
                            child: ListTile(
                              title: Text(todo),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => ref.read(todosNotifierProvider.notifier).removeTodo(todo),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final todo = 'New Todo ${todoList.length + 1}';
                        ref.read(todosNotifierProvider.notifier).addTodo(todo);
                      },
                      child: const Text('Add Todo'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kluczowe Punkty:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text('• Użycie adnotacji @riverpod dla AsyncNotifier'),
                    Text('• Obsługa stanów: ładowanie, błąd, dane'),
                    Text('• Asynchroniczne operacje'),
                    Text('• Automatyczne generowanie kodu'),
                    Text('• Bezpieczne typy dla danych asynchronicznych'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
