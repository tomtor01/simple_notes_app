import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateProvider for a simple counter
final counterProvider = StateProvider<int>((ref) => 0);

// Create a StateProvider for a text field
final textProvider = StateProvider<String>((ref) => '');

// Create a StateProvider for a boolean toggle
final toggleProvider = StateProvider<bool>((ref) => false);

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch all our states
    final int counter = ref.watch(counterProvider);
    final String text = ref.watch(textProvider);
    final bool isToggled = ref.watch(toggleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'StateProvider Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to use StateProvider with Riverpod. '
              'StateProvider is perfect for simple state that can be modified from the UI.',
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
                      'Counter Example:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => ref.read(counterProvider.notifier).state--,
                          child: const Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '$counter',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => ref.read(counterProvider.notifier).state++,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Text Input Example:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) => ref.read(textProvider.notifier).state = value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter text',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Current text: $text'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Toggle Example:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: Text('Toggle is ${isToggled ? 'ON' : 'OFF'}'),
                      value: isToggled,
                      onChanged: (value) => ref.read(toggleProvider.notifier).state = value,
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
                    Text('• StateProvider is for simple state management'),
                    Text('• Perfect for primitive types (int, bool, String)'),
                    Text('• State can be modified directly'),
                    Text('• No need for custom classes'),
                    Text('• Great for form inputs and toggles'),
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
