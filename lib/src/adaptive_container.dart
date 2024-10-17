import 'package:flutter/material.dart';

import 'adaptive_design.dart';
import 'breakpoint_manager.dart';

/// A widget that provides the adaptive design context to its children.
///
/// The [AdaptiveContainer] widget is used to provide the adaptive design
/// context to its children. It is an [InheritedWidget] that provides the
/// [ResponsiveSize], [BreakpointManager], and [DeviceInfo] to its children.
class AdaptiveContainer extends StatelessWidget {
  /// The builder for the mobile layout.
  final Widget Function(BuildContext context) mobileBuilder;

  /// The builder for the tablet layout.
  final Widget Function(BuildContext context)? tabletBuilder;

  /// The builder for the desktop layout.
  final Widget Function(BuildContext context)? desktopBuilder;

  /// The builder for the desktop layout.
  const AdaptiveContainer({
    super.key,
    required this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  });

  /// Returns the [AdaptiveDesignProvider] of the context.
  ///
  /// This method should be used to access the [AdaptiveDesignProvider] of the context.
  ///
  /// ```dart
  /// AdaptiveDesignProvider.of(context);
  /// ```
  static AdaptiveDesignProvider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AdaptiveDesignProvider>()!;

  /// Returns the [ResponsiveSize] of the context.
  ///
  /// This method should be used to access the [ResponsiveSize] of the context.
  ///
  /// ```dart
  /// AdaptiveDesignProvider.of(context).size;
  /// ```

  @override
  Widget build(BuildContext context) {
    /// Get the device type of the device.
    final DeviceType deviceType =
        AdaptiveDesignProvider.of(context).breakpointManager.deviceType;

    switch (deviceType) {
      /// If the device is a mobile device, return the mobile layout.
      case DeviceType.mobile:
        return mobileBuilder(context);

      /// If the device is a tablet device, return the tablet layout.
      case DeviceType.tablet:
        return (tabletBuilder ?? mobileBuilder)(context);

      /// If the device is a desktop device, return the desktop layout.
      case DeviceType.desktop:
        return (desktopBuilder ?? tabletBuilder ?? mobileBuilder)(context);
    }
  }
}
