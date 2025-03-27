import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Generate the provider code
part 'basic_provider_annotated_screen.g.dart';

// Define providers using annotations
@riverpod
String helloWorld(Ref ref) {
  return 'Hello World from Riverpod (Annotated)!';
}

@riverpod
int counter(Ref ref) {
  return 42;
}

class BasicProviderAnnotatedScreen extends ConsumerWidget {
  const BasicProviderAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read values from providers
    final String message = ref.watch(helloWorldProvider);
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Podstawowy (Adnotowany)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład Provider Podstawowy (z Adnotacjami)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje jak używać podstawowego Providera w Riverpod '
              'z wykorzystaniem nowej składni adnotacji. Provider jest najbardziej podstawową formą '
              'zarządzania stanem, która dostarcza niezmienną wartość.',
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
                      'Wartości Providera:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Wiadomość: $message',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Licznik: $counter',
                      style: const TextStyle(fontSize: 16),
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
                    Text('• Użycie adnotacji @riverpod'),
                    Text('• Nazwa providera jest generowana automatycznie'),
                    Text('• Nie ma potrzeby ręcznego definiowania zmiennej providera'),
                    Text('• Generowanie kodu obsługuje kod standardowy'),
                    Text('• Bezpieczny pod względem typów i łatwy w utrzymaniu'),
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
