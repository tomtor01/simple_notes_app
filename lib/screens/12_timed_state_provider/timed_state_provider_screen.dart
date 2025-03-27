import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

// Wygeneruj kod providera
part 'timed_state_provider_screen.g.dart';

// Provider z czasowym stanem
@riverpod
class TimedCounter extends _$TimedCounter {
  Timer? _timer;
  static const _autoDisposeDelay = Duration(seconds: 30);
  late final KeepAliveLink _link;

  @override
  int build() {
    // Zachowaj providera przy życiu gdy nie jest już używany
    _link = ref.keepAlive();

    // Rozpocznij timer gdy provider przestaje być używany
    ref.onCancel(() {
      _startDisposalTimer();
    });

    // Zatrzymaj timer gdy provider znów jest używany
    ref.onResume(() {
      _timer?.cancel();
    });

    // Upewnij się, że timer jest anulowany gdy stan providera jest usuwany
    ref.onDispose(() {
      _timer?.cancel();
      _link.close();
    });

    return 0;
  }

  void _startDisposalTimer() {
    _timer?.cancel();
    _timer = Timer(_autoDisposeDelay, () {
      _link.close();
    });
  }

  void increment() {
    state++;
  }
}

class TimedStateProviderScreen extends ConsumerWidget {
  const TimedStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(timedCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider z Czasowym Stanem'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Provider z Automatycznym Resetem',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ten przykład pokazuje provider z automatycznym usuwaniem, '
              'który utrzymuje swój stan przez 5 sekund po tym, jak przestanie '
              'być używany. Timer jest resetowany przy każdej zmianie stanu.',
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
                      'Licznik z opóźnionym usuwaniem:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => ref.read(timedCounterProvider.notifier).increment(),
                      icon: const Icon(Icons.add),
                      label: const Text('Zwiększ wartość'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Wskazówka: Przejdź do innego ekranu. Provider zostanie '
                      'usunięty po 5 sekundach od ostatniego użycia.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
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
