import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveText Tests', () {
    testWidgets('ResponsiveText scales font size correctly',
        (WidgetTester tester) async {
      final testWidget = AdaptiveDesignProvider(
        context: tester.element(find.byType(Container)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return const Scaffold(
                body: ResponsiveText(
                  'Test Text',
                  style: TextStyle(fontSize: 16),
                ),
              );
            },
          ),
        ),
      );

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(400.0, 800.0)),
          child: testWidget,
        ),
      );

      final textFinder = find.text('Test Text');
      expect(textFinder, findsOneWidget);

      final Text textWidget = tester.widget(textFinder);
      final double scaledFontSize =
          AdaptiveDesignProvider.of(tester.element(textFinder))
              .size
              .scaleFont(16);

      expect(textWidget.style?.fontSize, closeTo(scaledFontSize, 0.01));
    });
  });
}
