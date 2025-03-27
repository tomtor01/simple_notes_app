import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keep_alive_provider_annotated_screen.g.dart';

// Define a provider that keeps its state alive
@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
}

class KeepAliveProviderAnnotatedScreen extends ConsumerWidget {
  const KeepAliveProviderAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider z KeepAlive'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład Provider z KeepAlive',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje jak używać providera z keepAlive=true. '
              'Stan tego providera zostanie zachowany nawet po opuszczeniu ekranu '
              'i powrocie do niego później.',
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
                      'Licznik z zachowanym stanem:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Wartość: $counter',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => ref.read(counterProvider.notifier).decrement(),
                          child: const Text('-'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => ref.read(counterProvider.notifier).increment(),
                          child: const Text('+'),
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
                    Text('• Użycie @Riverpod(keepAlive: true)'),
                    Text('• Stan jest zachowany po wyjściu z ekranu'),
                    Text('• Przydatne dla danych, które chcemy zachować'),
                    Text('• Oszczędza ponowne pobieranie danych'),
                    Text('• Pamięć jest zwalniana dopiero przy zamknięciu aplikacji'),
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
