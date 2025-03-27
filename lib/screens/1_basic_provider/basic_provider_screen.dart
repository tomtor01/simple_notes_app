import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider that returns a String
final helloWorldProvider = Provider<String>((ref) {
  return 'Hello from Riverpod!';
});

// Define a provider that returns a number
final counterProvider = Provider<int>((ref) {
  return 42;
});

class BasicProviderScreen extends ConsumerWidget {
  const BasicProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read values from providers
    final String message = ref.watch(helloWorldProvider);
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Basic Provider Example'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Basic Provider Example', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to use a basic Provider in Riverpod. '
              'A Provider is the most basic form of state management that provides '
              'an immutable value.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Provider Values:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Message: $message', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Counter: $counter', style: const TextStyle(fontSize: 16)),
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
                    Text('Key Points:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Text('• Provider is used for immutable values'),
                    Text('• Values are accessed using ref.watch()'),
                    Text('• ConsumerWidget is used to access providers'),
                    Text('• Providers are defined globally'),
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
