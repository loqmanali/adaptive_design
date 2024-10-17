// lib/src/extensions.dart

import 'package:flutter/material.dart';

import 'adaptive_design.dart';
import 'responsive_size.dart';

/// A variant of [BuildContext] that takes a responsive size as input.
///
/// The size is scaled according to the [ResponsiveSize] of the context.
extension ResponsiveContextExtensions on BuildContext {
  ResponsiveSize get responsiveSize => AdaptiveDesignProvider.of(this).size;
}

/// A variant of [EdgeInsets] that takes a responsive size as input.
///
/// The size is scaled according to the [ResponsiveSize] of the context.
extension ResponsiveEdgeInsets on Widget {
  /// A variant of [EdgeInsets.all] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  Widget paddingAllR(double value) {
    return Padding(
      padding: EdgeInsets.all(value.ws),
      child: this,
    );
  }

  /// A variant of [EdgeInsets.symmetric] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  Widget paddingSymmetricR({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.ws,
        vertical: vertical.hs,
      ),
      child: this,
    );
  }

  /// A variant of [EdgeInsets.fromLTRB] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  Widget fromLTRBR(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left.ws,
        top.hs,
        right.ws,
        bottom.hs,
      ),
      child: this,
    );
  }

  /// A variant of [EdgeInsets.only] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  Widget paddingOnlyR({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left.ws,
        top: top.hs,
        right: right.ws,
        bottom: bottom.hs,
      ),
      child: this,
    );
  }
}

/// A variant of [BorderRadius.circular] that takes a responsive size as input.
///
/// The size is scaled according to the [ResponsiveSize] of the context.
extension ResponsiveBorderRadius on BorderRadius {
  /// A variant of [BorderRadius.circular] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  BorderRadius circularR(double radius) {
    return BorderRadius.circular(radius.ws);
  }

  /// A variant of [BorderRadius.all] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  BorderRadius allR(BuildContext context, double radius) {
    return BorderRadius.all(Radius.circular(radius.ws));
  }
}

/// A variant of [SizedBox] that takes a responsive size as input.
///
/// The size is scaled according to the [ResponsiveSize] of the context.
extension ResponsiveSizedBoxExtensions on SizedBox {
  /// A variant of [SizedBox.width] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  SizedBox widthR(double width) {
    return SizedBox(width: width.ws);
  }

  /// A variant of [SizedBox.height] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  SizedBox heightR(double height) {
    return SizedBox(height: height.hs);
  }

  /// A variant of [SizedBox.size] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  SizedBox sizeR(double width, double height) {
    return SizedBox(
      width: width.ws,
      height: height.hs,
    );
  }
}

/// A variant of [num] that takes a responsive size as input.
///
/// The size is scaled according to the [ResponsiveSize] of the context.
extension ResponsiveNumExtensions on num {
  /// A variant of [num.toDouble] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  /// scaleWidth
  /// Purpose: This method scales a given size based on the ratio of the current screen width to a predefined base width.
  /// Usage: It is useful when you want to maintain a consistent size across different screen sizes based on a specific design guideline. For example, if you have a design that specifies a button width of 100 pixels on a base width of 375 pixels, you would use scaleWidth(100) to adjust that size for the current screen width.
  /// ````
  /// SizedBox(width: 100.ws);
  /// ````
  double get ws => AdaptiveDesignProvider.currentSize.scaleWidth(toDouble());

  /// A variant of [num.toDouble] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  /// scaleHeight
  /// Purpose: This method scales a given size based on the ratio of the current screen height to a predefined base height.
  /// Usage: It is useful when you want to maintain a consistent size across different screen sizes based on a specific design guideline. For example, if you have a design that specifies a button height of 50 pixels on a base height of 812 pixels, you would use scaleHeight(50) to adjust that size for the current screen height.
  /// ````
  /// SizedBox(height: 50.hs);
  /// ````
  double get hs => AdaptiveDesignProvider.currentSize.scaleHeight(toDouble());

  /// A variant of [num.toDouble] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  double get sp => AdaptiveDesignProvider.currentSize.scaleFont(toDouble());

  /// A variant of [num.toDouble] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  /// wp
  /// Purpose: This method calculates a width value as a percentage of the current screen width.
  /// Usage: It is useful when you want to set a widget's width relative to the screen size. For example, if you want a button to take up 50% of the screen width, you would use wp(50).
  /// ````
  /// SizedBox(width: 50.wp);
  /// ````
  double get wp => AdaptiveDesignProvider.currentSize.wp(toDouble());

  /// A variant of [num.toDouble] that takes a responsive size as input.
  ///
  /// The size is scaled according to the [ResponsiveSize] of the context.
  /// hp
  /// Purpose: This method calculates a height value as a percentage of the current screen height.
  /// Usage: It is useful when you want to set a widget's height relative to the screen size. For example, if you want a button to take up 50% of the screen height, you would use hp(50).
  /// ````
  /// SizedBox(height: 50.hp);
  /// ````
  double get hp => AdaptiveDesignProvider.currentSize.hp(toDouble());
}
