import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math' show pi, e, sqrt;

// Generate the provider code
part 'family_provider_annotated_screen.g.dart';

// Define providers using annotations
@riverpod
Future<Map<String, String>> user(Ref ref, int id) async {
  // Symulacja opóźnienia API
  await Future.delayed(const Duration(seconds: 1));

  // Zwracamy przykładowe dane użytkownika
  return {
    'id': id.toString(),
    'name': 'User $id',
    'email': 'user$id@example.com',
  };
}

@riverpod
String numberFormatter(Ref ref, double number) {
  return number.toStringAsFixed(2);
}

class FamilyProviderAnnotatedScreen extends ConsumerWidget {
  const FamilyProviderAnnotatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Provider (Adnotowany)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Przykład Family Provider (z Adnotacjami)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje jak używać Family Provider w Riverpod '
              'z wykorzystaniem nowej składni adnotacji. Family Provider pozwala '
              'na tworzenie providerów z parametrami.',
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
                      'Przykład User Provider:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildUserCard(ref, 1),
                    const SizedBox(height: 8),
                    _buildUserCard(ref, 2),
                    const SizedBox(height: 8),
                    _buildUserCard(ref, 3),
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
                      'Przykład formatowania liczb:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text('π = ${ref.watch(numberFormatterProvider(pi))}'),
                    Text('e = ${ref.watch(numberFormatterProvider(e))}'),
                    Text('√2 = ${ref.watch(numberFormatterProvider(sqrt(2)))}'),
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
                    Text('• Użycie parametrów w providerach'),
                    Text('• Automatyczne generowanie kodu'),
                    Text('• Bezpieczne typy dla parametrów'),
                    Text('• Wielokrotne użycie tego samego providera'),
                    Text('• Optymalizacja pod kątem wydajności'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(WidgetRef ref, int userId) {
    final AsyncValue<Map<String, dynamic>> userAsync = ref.watch(userProvider(userId));

    return userAsync.when(
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => Card(
        color: Colors.red.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Error: $error'),
        ),
      ),
      data: (user) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Text(user['id'].toString())),
          title: Text(user['name']),
          subtitle: Text(user['email']),
          trailing: Text('${user['points']} pts'),
        ),
      ),
    );
  }
}
