import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Generate the provider code
part 'state_notifier_annotated_screen.g.dart';

// Define a class to hold our state
class Counter {
  final int value;
  const Counter(this.value);
}

// Define a Notifier using annotations
@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  Counter build() {
    return const Counter(0);
  }

  void increment() {
    state = Counter(state.value + 1);
  }

  void decrement() {
    state = Counter(state.value - 1);
  }

  void reset() {
    state = const Counter(0);
  }
}

class StateNotifierAnnotatedScreen extends ConsumerWidget {
  const StateNotifierAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state
    final counter = ref.watch(counterNotifierProvider);
    // Get the notifier to call methods
    ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier (Adnotowany)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład StateNotifier (z Adnotacjami)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład demonstruje użycie StateNotifier w Riverpod '
              'z wykorzystaniem nowej składni adnotacji. StateNotifier jest '
              'rekomendowanym sposobem zarządzania zmiennym stanem.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Licznik StateNotifier:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => ref.read(counterNotifierProvider.notifier).decrement(),
                          child: const Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${counter.value}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => ref.read(counterNotifierProvider.notifier).increment(),
                          child: const Icon(Icons.add),
                        ),
                      ],
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
                    Text('• Użycie adnotacji @riverpod dla StateNotifier'),
                    Text('• Klasa StateNotifier zarządza stanem'),
                    Text('• Metody do modyfikacji stanu'),
                    Text('• Automatyczne generowanie kodu'),
                    Text('• Bezpieczne typy i immutability'),
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
