import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveSize Tests', () {
    testWidgets('scaleWidth and scaleHeight return correct values',
        (WidgetTester tester) async {
      // Define a widget to provide MediaQuery data
      final testWidget = Builder(
        builder: (context) {
          final size = ResponsiveSize(
            context: context,
            baseWidth: 375.0,
            baseHeight: 812.0,
          );

          expect(size.width, equals(800.0));
          expect(size.height, equals(600.0));

          expect(size.scaleWidth(100), equals(100 * 800.0 / 375.0));
          expect(size.scaleHeight(200), equals(200 * 600.0 / 812.0));

          return Container();
        },
      );

      // Build the widget with a fixed screen size
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(800.0, 600.0)),
            child: testWidget,
          ),
        ),
      );
    });

    testWidgets('wp and hp return correct percentage values',
        (WidgetTester tester) async {
      final testWidget = Builder(
        builder: (context) {
          final size = ResponsiveSize(context: context);

          expect(size.wp(50), equals(size.width * 0.5));
          expect(size.hp(25), equals(size.height * 0.25));

          return Container();
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400.0, 800.0)),
            child: testWidget,
          ),
        ),
      );
    });

    testWidgets('scaleFont returns correct scaled font size',
        (WidgetTester tester) async {
      final testWidget = Builder(
        builder: (context) {
          final size = ResponsiveSize(
            context: context,
            baseWidth: 375.0,
            baseHeight: 812.0,
          );

          double expectedFontSize = 16 * ((400.0 / 375.0 + 800.0 / 812.0) / 2);

          expect(size.scaleFont(16), closeTo(expectedFontSize, 0.01));

          return Container();
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400.0, 800.0)),
            child: testWidget,
          ),
        ),
      );
    });
  });
}
