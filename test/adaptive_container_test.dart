import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveContainer Tests', () {
    testWidgets('AdaptiveContainer builds correct widget for DeviceType.mobile',
        (WidgetTester tester) async {
      final testWidget = AdaptiveDesignProvider(
        context: tester.element(find.byType(Container)),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400.0, 800.0)),
            child: AdaptiveContainer(
              mobileBuilder: (_) => const Text('Mobile'),
              tabletBuilder: (_) => const Text('Tablet'),
              desktopBuilder: (_) => const Text('Desktop'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      expect(find.text('Mobile'), findsOneWidget);
    });

    testWidgets('AdaptiveContainer builds correct widget for DeviceType.tablet',
        (WidgetTester tester) async {
      final testWidget = AdaptiveDesignProvider(
        context: tester.element(find.byType(Container)),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(800.0, 800.0)),
            child: AdaptiveContainer(
              mobileBuilder: (_) => const Text('Mobile'),
              tabletBuilder: (_) => const Text('Tablet'),
              desktopBuilder: (_) => const Text('Desktop'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      expect(find.text('Tablet'), findsOneWidget);
    });

    testWidgets(
        'AdaptiveContainer builds correct widget for DeviceType.desktop',
        (WidgetTester tester) async {
      final testWidget = AdaptiveDesignProvider(
        context: tester.element(find.byType(Container)),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(1300.0, 800.0)),
            child: AdaptiveContainer(
              mobileBuilder: (_) => const Text('Mobile'),
              tabletBuilder: (_) => const Text('Tablet'),
              desktopBuilder: (_) => const Text('Desktop'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      expect(find.text('Desktop'), findsOneWidget);
    });
  });
}
