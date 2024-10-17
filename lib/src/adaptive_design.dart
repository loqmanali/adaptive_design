import 'package:flutter/material.dart';

import 'breakpoint_manager.dart';
import 'device_info.dart';
import 'responsive_size.dart';

/// A widget that provides the adaptive design context to its children.
///
/// The [AdaptiveDesignProvider] widget is used to provide the adaptive design
/// context to its children. It is an [InheritedWidget] that provides the
/// [ResponsiveSize], [BreakpointManager], and [DeviceInfo] to its children.
class AdaptiveDesignProvider extends InheritedWidget {
  /// The current size of the device.
  final ResponsiveSize size;

  /// The breakpoint manager of the device.
  final BreakpointManager breakpointManager;

  /// The device info of the device.
  final DeviceInfo deviceInfo;

  static late ResponsiveSize currentSize;

  AdaptiveDesignProvider({
    super.key,
    required super.child,
    required BuildContext context,
    double baseWidth = 375.0,
    double baseHeight = 812.0,
    double? mobileBreakpoint,
    double? tabletBreakpoint,
  })  : size = ResponsiveSize(
          context: context,
          baseWidth: baseWidth,
          baseHeight: baseHeight,
        ),
        breakpointManager = BreakpointManager(
          context: context,
          mobileBreakpoint: mobileBreakpoint,
          tabletBreakpoint: tabletBreakpoint,
        ),
        deviceInfo = DeviceInfo(context: context) {
    currentSize = size;
  }

  /// Returns the [AdaptiveDesignProvider] of the context.
  ///
  /// This method should be used to access the [AdaptiveDesignProvider] of the context.
  ///
  /// ```dart
  /// AdaptiveDesignProvider.of(context);
  /// ```
  static AdaptiveDesignProvider of(BuildContext context) {
    final AdaptiveDesignProvider? result =
        context.dependOnInheritedWidgetOfExactType<AdaptiveDesignProvider>();
    assert(result != null, 'No AdaptiveDesignProvider found in context');
    return result!;
  }

  /// Returns the [ResponsiveSize] of the context.
  ///
  /// This method should be used to access the [ResponsiveSize] of the context.
  ///
  /// ```dart
  /// AdaptiveDesignProvider.of(context).size;
  /// ```

  @override
  bool updateShouldNotify(AdaptiveDesignProvider oldWidget) {
    return false;
  }
}
