import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceInfo Tests', () {
    testWidgets('Device orientation is correctly identified',
        (WidgetTester tester) async {
      Future<void> testOrientation(
          Orientation orientation, bool isPortrait) async {
        final testWidget = Builder(
          builder: (context) {
            final deviceInfo = DeviceInfo(context: context);
            expect(deviceInfo.orientation, equals(orientation));
            expect(deviceInfo.isPortrait, equals(isPortrait));
            expect(deviceInfo.isLandscape, equals(!isPortrait));
            return Container();
          },
        );

        await tester.pumpWidget(
          MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(
                size: orientation == Orientation.portrait
                    ? const Size(400, 800)
                    : const Size(800, 400),
              ),
              child: testWidget,
            ),
          ),
        );
      }

      await testOrientation(Orientation.portrait, true);
      await testOrientation(Orientation.landscape, false);
    });

    testWidgets('Platform is correctly identified',
        (WidgetTester tester) async {
      final testWidget = Builder(
        builder: (context) {
          final deviceInfo = DeviceInfo(context: context);
          expect(deviceInfo.isIOS, equals(false));
          expect(deviceInfo.isAndroid, equals(true));
          return Container();
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(platform: TargetPlatform.android),
          home: testWidget,
        ),
      );
    });
  });
}
