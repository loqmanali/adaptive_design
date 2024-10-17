import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension ScaleWidth on double {
  double scaleWidth(double factor) {
    return this * factor; // Adjust the scaling logic as needed
  }
}

void main() {
  group('Extensions Tests', () {
    testWidgets('Num extensions (.w, .h, .sp) return correct scaled values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        AdaptiveDesignProvider(
          context: tester.element(find.byType(Container)),
          child: MaterialApp(
            home: Container(), // Use Container directly
          ),
        ),
      );

      final size = tester.widget<MediaQuery>(find.byType(MediaQuery)).data.size;
      expect(100.ws, equals(100 * size.width / 375.0));
      expect(200.hs, equals(200 * size.height / 812.0));
      expect(16.sp,
          closeTo(16 * ((size.width / 375.0 + size.height / 812.0) / 2), 0.01));
    });

    testWidgets('EdgeInsets extensions return correct values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        AdaptiveDesignProvider(
          context: tester.element(find.byType(Container)),
          child: MaterialApp(
            home: Container(), // Use Container directly
          ),
        ),
      );

      final padding = EdgeInsets.all(16.ws);
      final size = tester.widget<MediaQuery>(find.byType(MediaQuery)).data.size;
      expect(padding, equals(EdgeInsets.all(size.width.scaleWidth(16))));
    });

    testWidgets('BorderRadius extensions return correct values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        AdaptiveDesignProvider(
          context: tester.element(find.byType(Container)),
          child: MaterialApp(
            home: Container(), // Use Container directly
          ),
        ),
      );

      final borderRadius = BorderRadius.circular(12.ws);
      final size = tester.widget<MediaQuery>(find.byType(MediaQuery)).data.size;
      expect(borderRadius,
          equals(BorderRadius.circular(size.width.scaleWidth(12))));
    });
  });
}
