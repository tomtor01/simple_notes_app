import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simulated API response delay
Future<List<String>> fetchTodos() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return ['Learn Riverpod', 'Build awesome apps', 'Write clean code', 'Test thoroughly', 'Deploy to production'];
}

// Define an AsyncNotifier to manage async state
class TodosNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    // Initial fetch of todos
    return fetchTodos();
  }

  Future<void> addTodo(String todo) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    // Update state with new todo
    state = AsyncValue.data([...state.value ?? [], todo]);
  }

  Future<void> removeTodo(String todo) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

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

// Create an AsyncNotifierProvider that will provide our TodosNotifier
final todosProvider = AsyncNotifierProvider<TodosNotifier, List<String>>(TodosNotifier.new);

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the async value
    final AsyncValue<List<String>> todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncNotifier Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(todosProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AsyncNotifier Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to use AsyncNotifier with Riverpod. '
              'AsyncNotifier is perfect for handling asynchronous data with loading, '
              'error, and data states.',
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
                                onPressed: () => ref.read(todosProvider.notifier).removeTodo(todo),
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
                        ref.read(todosProvider.notifier).addTodo(todo);
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
                      'Key Points:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text('• AsyncNotifier handles loading, error, and data states'),
                    Text('• Use .when() to handle different states'),
                    Text('• Loading state is automatic'),
                    Text('• Error handling is built-in'),
                    Text('• Perfect for API calls and async operations'),
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
