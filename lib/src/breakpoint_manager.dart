import 'package:flutter/material.dart';

/// The type of device.
enum DeviceType { mobile, tablet, desktop }

/// A class that manages the breakpoints of the device.
///
/// The breakpoints are used to determine the device type of the device.
/// The default breakpoints are 600.0 for mobile and 1024.0 for tablet.
///
/// The [BreakpointManager] is used to determine the device type of the device.

class BreakpointManager {
  final BuildContext context;
  final double mobileBreakpoint;
  final double tabletBreakpoint;

  /// Creates a new [BreakpointManager] with the given breakpoints.
  ///
  /// The breakpoints are used to determine the device type of the device.
  /// The default breakpoints are 600.0 for mobile and 1024.0 for tablet.
  BreakpointManager({
    required this.context,
    double? mobileBreakpoint,
    double? tabletBreakpoint,
  })  : mobileBreakpoint = mobileBreakpoint ?? 600.0,
        tabletBreakpoint = tabletBreakpoint ?? 1024.0;

  /// Returns the device type of the device.
  ///
  /// The device type is determined by the width of the device.
  /// If the width is less than the mobile breakpoint, the device is a mobile device.
  /// If the width is less than the tablet breakpoint, the device is a tablet device.
  /// Otherwise, the device is a desktop device.
  DeviceType get deviceType {
    double width = MediaQuery.sizeOf(context).width;
    if (width < mobileBreakpoint) return DeviceType.mobile;
    if (width < tabletBreakpoint) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}
