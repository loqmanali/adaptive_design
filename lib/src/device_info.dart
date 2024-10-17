import 'package:flutter/material.dart';

/// A class that provides information about the device.
///
/// The [DeviceInfo] class provides information about the device such as the
/// orientation, the platform, and the device type.
class DeviceInfo {
  /// The context of the device.
  final BuildContext context;

  const DeviceInfo({required this.context});

  /// Returns the orientation of the device.
  Orientation get orientation => MediaQuery.of(context).orientation;

  /// Returns true if the device is in portrait mode.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns true if the device is in landscape mode.
  ///
  /// The device is in landscape mode if the orientation is landscape.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns true if the device is an iOS device.
  bool get isIOS => Theme.of(context).platform == TargetPlatform.iOS;

  /// Returns true if the device is an Android device.
  bool get isAndroid => Theme.of(context).platform == TargetPlatform.android;

  /// Returns true if the device is a web device.
  bool get isWeb =>
      Theme.of(context).platform == TargetPlatform.fuchsia; // Simplified check
}
