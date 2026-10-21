import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:niva_mobile/app/app_state.dart';
import 'package:niva_mobile/app/niva_app.dart';
import 'package:niva_mobile/storage/in_memory_local_store.dart';

void main() {
  testWidgets('NIVA app renders the home experience', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localStoreProvider.overrideWithValue(InMemoryLocalStore()),
        ],
        child: NivaApp(
          theme: ThemeData(
            useMaterial3: true,
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Welcome to NIVA'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('No upcoming events available'), findsNothing);

    await tester.enterText(find.byType(TextField), 'Sam');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Good day, Sam'), findsOneWidget);
    expect(find.text('No upcoming events available'), findsOneWidget);
    expect(find.text('Weather - Weather unavailable'), findsOneWidget);

    await tester.tap(find.text('Today'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add event'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Dentist');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Dentist'), findsOneWidget);
  });
}
