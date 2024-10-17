import 'package:adaptive_design/adaptive_design.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveDesignProvider(
      context: context,
      mobileBreakpoint: 600,
      tabletBreakpoint: 900,
      child: const MaterialApp(
        title: 'Adaptive Design Demo',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final adaptiveDesign = AdaptiveDesignProvider.of(context);
    final size = adaptiveDesign.size;
    final deviceInfo = adaptiveDesign.deviceInfo;

    return Scaffold(
      appBar: AppBar(
        title: const ResponsiveText('Adaptive Design Demo'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: size.scaleWidth(150),
              height: size.scaleHeight(100),
              color: Colors.blue,
              child: Center(
                child: ResponsiveText(
                  'This is a responsive container ${deviceInfo.isAndroid}',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const AdaptiveLayoutExample(),
          const SizedBox(height: 20),
          ResponsiveText(
            'This is a responsive text ${adaptiveDesign.breakpointManager.mobileBreakpoint}',
          ),
          ResponsiveText('${size.scaleHeight(100)}'),
          ResponsiveText('${size.scaleWidth(100)}'),
          ResponsiveText('${size.scaleFont(100)}'),
          ResponsiveText('${size.wp(100)}'),
          ResponsiveText('${size.hp(100)}').paddingAllR(10),
          const SizedBox().heightR(10),
          const SizedBox().widthR(10),
          const SizedBox().sizeR(10, 10),
          ResponsiveText('${size.hp(100)}').paddingAllR(10),
        ],
      ),
    );
  }
}

class AdaptiveLayoutExample extends StatelessWidget {
  const AdaptiveLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      mobileBuilder: (_) => const MobileLayout(),
      tabletBuilder: (_) => const TabletLayout(),
      desktopBuilder: (_) => const DesktopLayout(),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: ResponsiveText('Mobile Layout'));
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: ResponsiveText('Tablet Layout'));
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: ResponsiveText('Desktop Layout'));
  }
}
