import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BreakpointManager Tests', () {
    testWidgets('deviceType returns correct DeviceType',
        (WidgetTester tester) async {
      Future<void> testDeviceType(double width, DeviceType expectedType) async {
        final testWidget = Builder(
          builder: (context) {
            final breakpointManager = BreakpointManager(context: context);
            expect(breakpointManager.deviceType, equals(expectedType));
            return Container();
          },
        );

        await tester.pumpWidget(
          MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(size: Size(width, 800.0)),
              child: testWidget,
            ),
          ),
        );
      }

      await testDeviceType(400.0, DeviceType.mobile);
      await testDeviceType(700.0, DeviceType.tablet);
      await testDeviceType(1300.0, DeviceType.desktop);
    });
  });
}
