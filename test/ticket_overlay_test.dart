import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_overlay/ticket_overlay.dart';

void main() {
  testWidgets('OverlayAnimation correctly displays and removes overlay',
      (WidgetTester tester) async {
    // Define a key to identify the overlay content in the widget tree.
    const overlayKey = Key('OverlayContent');

    // Build the test widget tree with an overlay trigger.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    TicketAnimation.show(
                      context: context,
                      duration: const Duration(seconds: 2),
                      child: const Text(
                        'Animated Overlay',
                        key: overlayKey,
                      ),
                    );
                  },
                  child: const Text('Show Overlay'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Verify initial state: Overlay is not present.
    expect(find.byKey(overlayKey), findsNothing);

    // Tap the button to trigger the overlay animation.
    await tester.tap(find.text('Show Overlay'));
    await tester.pump(); // Allow the overlay insertion to process.

    // Verify the overlay content is displayed.
    expect(find.byKey(overlayKey), findsOneWidget);

    // Simulate part of the animation (1 second).
    await tester.pump(const Duration(seconds: 1));
    // The overlay should still be present.
    expect(find.byKey(overlayKey), findsOneWidget);

    // Simulate the rest of the animation duration (1 second).
    await tester.pump(const Duration(seconds: 1));
    // After the full duration, the overlay should be removed.
  });
}
