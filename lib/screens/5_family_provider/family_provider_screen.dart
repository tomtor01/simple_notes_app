import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A provider family that takes an ID and returns a user
final userProvider = FutureProvider.family<Map<String, dynamic>, int>((ref, id) async {
  // Simulate API call
  await Future.delayed(const Duration(seconds: 1));

  // Return mock user data
  return {
    'id': id,
    'name': 'User $id',
    'email': 'user$id@example.com',
    'points': id * 100,
  };
});

// A provider family that formats numbers with a specific number of decimal places
final numberFormatterProvider = Provider.family<String, double>((ref, number) {
  return number.toStringAsFixed(2);
});

class FamilyProviderScreen extends ConsumerWidget {
  const FamilyProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Provider Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Family Provider Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how to use Provider.family with Riverpod. '
              'Family providers allow you to create providers that take parameters.',
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
                      'User Provider Example:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    // Display multiple users using the same provider family
                    for (var i = 1; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: _buildUserCard(ref, i),
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
                      'Number Formatter Example:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    // Display formatted numbers
                    Text('π: ${ref.watch(numberFormatterProvider(3.14159))}'),
                    Text('e: ${ref.watch(numberFormatterProvider(2.71828))}'),
                    Text('√2: ${ref.watch(numberFormatterProvider(1.41421))}'),
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
                    Text('• Family providers take parameters'),
                    Text('• Great for data that depends on IDs'),
                    Text('• Can be used with any provider type'),
                    Text('• Parameters can be of any type'),
                    Text('• Caches results for each parameter'),
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
