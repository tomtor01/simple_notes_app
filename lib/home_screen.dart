import 'package:flutter/material.dart';
import 'widgets/navigation_button.dart';
import 'screens/1_basic_provider/basic_provider_screen.dart';
import 'screens/2_state_notifier/state_notifier_screen.dart';
import 'screens/3_async_notifier/async_notifier_screen.dart';
import 'screens/4_state_provider/state_provider_screen.dart';
import 'screens/5_family_provider/family_provider_screen.dart';
import 'screens/6_basic_provider_annotated/basic_provider_annotated_screen.dart';
import 'screens/7_state_notifier_annotated/state_notifier_annotated_screen.dart';
import 'screens/8_async_notifier_annotated/async_notifier_annotated_screen.dart';
import 'screens/9_state_provider_annotated/state_provider_annotated_screen.dart';
import 'screens/10_family_provider_annotated/family_provider_annotated_screen.dart';
import 'screens/11_keep_alive_provider_annotated/keep_alive_provider_annotated_screen.dart';
import 'screens/12_timed_state_provider/timed_state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Przykłady Riverpod'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Witaj w Przykładach Riverpod', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: const [
                  NavigationButton(
                    title: '1. Podstawowy Provider',
                    destination: BasicProviderScreen(),
                    description: 'Zrozumienie podstawowej koncepcji Providera w Riverpod',
                    filename: 'screens/1_basic_provider/basic_provider_screen.dart',
                  ),
                  NavigationButton(
                    title: '2. StateNotifier Provider',
                    destination: StateNotifierScreen(),
                    description: 'Zarządzanie zmiennym stanem za pomocą StateNotifier',
                    filename: 'screens/2_state_notifier/state_notifier_screen.dart',
                  ),
                  NavigationButton(
                    title: '3. AsyncNotifier Provider',
                    destination: AsyncNotifierScreen(),
                    description: 'Obsługa danych asynchronicznych z AsyncNotifier',
                    filename: 'screens/3_async_notifier/async_notifier_screen.dart',
                  ),
                  NavigationButton(
                    title: '4. State Provider',
                    destination: StateProviderScreen(),
                    description: 'Proste zarządzanie stanem za pomocą StateProvider',
                    filename: 'screens/4_state_provider/state_provider_screen.dart',
                  ),
                  NavigationButton(
                    title: '5. Family Provider',
                    destination: FamilyProviderScreen(),
                    description: 'Providery parametryzowane z modyfikatorem Family',
                    filename: 'screens/5_family_provider/family_provider_screen.dart',
                  ),
                  NavigationButton(
                    title: '6. Podstawowy Provider (z Adnotacjami)',
                    destination: BasicProviderAnnotatedScreen(),
                    description: 'Podstawowy Provider z generowaniem kodu',
                    filename: 'screens/6_basic_provider_annotated/basic_provider_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '7. StateNotifier (z Adnotacjami)',
                    destination: StateNotifierAnnotatedScreen(),
                    description: 'StateNotifier z generowaniem kodu',
                    filename: 'screens/7_state_notifier_annotated/state_notifier_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '8. AsyncNotifier (z Adnotacjami)',
                    destination: AsyncNotifierAnnotatedScreen(),
                    description: 'AsyncNotifier z generowaniem kodu',
                    filename: 'screens/8_async_notifier_annotated/async_notifier_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '9. State Provider (z Adnotacjami)',
                    destination: StateProviderAnnotatedScreen(),
                    description: 'StateProvider z generowaniem kodu',
                    filename: 'screens/9_state_provider_annotated/state_provider_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '10. Family Provider (z Adnotacjami)',
                    destination: FamilyProviderAnnotatedScreen(),
                    description: 'Family Provider z generowaniem kodu',
                    filename: 'screens/10_family_provider_annotated/family_provider_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '11. KeepAlive Provider (z Adnotacjami)',
                    destination: KeepAliveProviderAnnotatedScreen(),
                    description: 'Provider z keepAlive=true do zachowania stanu',
                    filename: 'screens/11_keep_alive_provider_annotated/keep_alive_provider_annotated_screen.dart',
                  ),
                  NavigationButton(
                    title: '12. Provider z Czasowym Stanem',
                    destination: TimedStateProviderScreen(),
                    description: 'Provider zachowujący stan przez 30 sekund po ostatnim użyciu',
                    filename: 'screens/12_timed_state_provider/timed_state_provider_screen.dart',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
