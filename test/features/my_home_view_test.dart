import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ticket/main.dart';

void main() {
  group(
    'my_home_view_test',
    () {
      testWidgets(
        'ticket testing',
        (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());
          await tester.pump();

          final Finder listFinder = find.byType(Scrollable);
          final Finder personCounter = find.text('01');

          await tester.scrollUntilVisible(
            personCounter,
            100.0,
            scrollable: listFinder,
          );

          // the default state of Person counter is 01
          expect(personCounter, findsOneWidget);

          final Finder personIncrementCounter =
              find.byKey(const Key('increment'));
          expect(personIncrementCounter, findsOneWidget);

          final Finder personDecrementCounter =
              find.byKey(const Key('decrement'));
          expect(personDecrementCounter, findsOneWidget);

          // expecting the counter can't be decrement below 1
          await tester.tap(personDecrementCounter);
          await tester.pump();
          expect(personCounter, findsOneWidget);

          // expecting the counter to be incremented by 1
          // when the user tap the increment button
          await tester.tap(personIncrementCounter);
          await tester.pump();
          expect(find.text('02'), findsOneWidget);

          // expect the counter to be decremented by 1
          await tester.tap(personDecrementCounter);
          await tester.pump();
          expect(personCounter, findsOneWidget);

          // expecting to find nothing
          await tester.tap(personIncrementCounter);
          await tester.pump();
          expect(find.text('01'), findsNothing);
        },
      );
    },
  );
}
