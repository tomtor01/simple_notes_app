import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a class to hold our state
class Counter {
  final int value;
  const Counter(this.value);
}

// Define a StateNotifier to manage the state
class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(const Counter(0));

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

// Create a StateNotifierProvider that will provide our CounterNotifier
final counterNotifierProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state
    final counter = ref.watch(counterNotifierProvider);
    // Get the notifier to call methods
    final counterNotifier = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'StateNotifier Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to use StateNotifier with Riverpod. '
              'StateNotifier is used for managing mutable state with immutable state updates.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Counter Value:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${counter.value}',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: counterNotifier.decrement,
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: counterNotifier.reset,
                          child: const Icon(Icons.refresh),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: counterNotifier.increment,
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
                      'Key Points:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text('• StateNotifier manages mutable state'),
                    Text('• State updates are immutable'),
                    Text('• Use ref.watch() to observe state changes'),
                    Text('• Use ref.read() to access methods'),
                    Text('• State is updated through methods'),
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
