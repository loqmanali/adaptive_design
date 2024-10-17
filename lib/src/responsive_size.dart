import 'package:flutter/material.dart';

/// A class that provides the responsive size of the device.
class ResponsiveSize {
  /// The context of the device.
  final BuildContext context;

  /// The base width of the device.
  final double baseWidth;

  /// The base height of the device.
  final double baseHeight;

  /// Creates a new [ResponsiveSize] with the given context and base width and height.
  ///
  /// The base width and height are used to calculate the responsive size of the device.
  /// The default base width and height are 375.0 and 812.0 respectively.
  const ResponsiveSize({
    required this.context,
    this.baseWidth = 375.0,
    this.baseHeight = 812.0,
  });

  /// Returns the width of the device.
  double get width => MediaQuery.sizeOf(context).width;

  /// Returns the height of the device.
  double get height => MediaQuery.sizeOf(context).height;

  /// Width as a percentage of screen width
  double wp(double percentage) => width * percentage / 100;

  /// Height as a percentage of screen height
  double hp(double percentage) => height * percentage / 100;

  /// Scaled width based on base width
  double scaleWidth(double size) => size * width / baseWidth;

  /// Scaled height based on base height
  double scaleHeight(double size) => size * height / baseHeight;

  /// Scaled font size
  double scaleFont(double size) =>
      size * (width / baseWidth + height / baseHeight) / 2;
}
