import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Generate the provider code
part 'state_provider_annotated_screen.g.dart';

// Define providers using annotations
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
  void setValue(int value) => state = value;
}

@riverpod
class TextValue extends _$TextValue {
  @override
  String build() => '';

  void setValue(String value) => state = value;
}

@riverpod
class Toggle extends _$Toggle {
  @override
  bool build() => false;

  void setValue(bool value) => state = value;
}

class StateProviderAnnotatedScreen extends ConsumerWidget {
  const StateProviderAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch all our states
    final int counter = ref.watch(counterProvider);
    final String text = ref.watch(textValueProvider);
    final bool isToggled = ref.watch(toggleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider (Adnotowany)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład StateProvider (z Adnotacjami)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje jak używać StateProvider w Riverpod '
              'z wykorzystaniem nowej składni adnotacji. StateProvider jest '
              'używany do prostego zarządzania stanem z możliwością modyfikacji.',
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
                      'Przykłady StateProvider:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text('Licznik:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => ref.read(counterProvider.notifier).decrement(),
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
                          onPressed: () => ref.read(counterProvider.notifier).increment(),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('Pole tekstowe:'),
                    TextField(
                      onChanged: (value) => ref.read(textValueProvider.notifier).setValue(value),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Wprowadź tekst',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Wprowadzony tekst: $text'),
                    const SizedBox(height: 16),
                    const Text('Przełącznik:'),
                    SwitchListTile(
                      title: Text('Przełącznik jest ${isToggled ? 'WŁĄCZONY' : 'WYŁĄCZONY'}'),
                      value: isToggled,
                      onChanged: (value) => ref.read(toggleProvider.notifier).setValue(value),
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
                    Text('• Proste zarządzanie stanem'),
                    Text('• Łatwa modyfikacja wartości'),
                    Text('• Automatyczne generowanie kodu'),
                    Text('• Integracja z widgetami Flutter'),
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
