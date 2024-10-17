import 'package:flutter/material.dart';

import '../adaptive_design.dart';

class ResponsiveText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ResponsiveText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveSize size = AdaptiveDesignProvider.of(context).size;

    double fontSize = style?.fontSize ?? 14.0;
    double scaledFontSize = size.scaleFont(fontSize);

    return Text(
      data,
      style: style?.copyWith(fontSize: scaledFontSize) ??
          TextStyle(fontSize: scaledFontSize),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
