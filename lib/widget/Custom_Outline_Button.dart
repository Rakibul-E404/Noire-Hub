/*

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Widget? child;

  // Appearance
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? disabledForegroundColor;
  final Color? overlayColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  // Dimensions
  final double? width;
  final double? height;
  final double? elevation;

  // Padding and Margin
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  // Shape
  final BorderRadiusGeometry? borderRadius;
  final double? borderWidth;
  final BorderSide? borderSide;
  final OutlinedBorder? shape;

  // Text style
  final TextStyle? textStyle;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle? fontStyle;

  // Icons
  final Widget? prefixIcon;              // <-- renamed from icons
  final Widget? suffixIcon;
  final String? prefixSvgIconPath;      // <-- renamed from svgIconPath
  final String? suffixSvgIconPath;
  final double? iconSize;
  final Color? iconColor;
  final double? gap;
  final MainAxisAlignment? contentAlignment;

  // States
  final bool isDisabled;
  final bool isFullWidth;
  final bool isRounded;
  final bool hasShadow;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.child,
    this.foregroundColor,
    this.backgroundColor,
    this.disabledForegroundColor,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.width,
    this.height,
    this.elevation,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth,
    this.borderSide,
    this.shape,
    this.textStyle,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.letterSpacing,
    this.fontFamily,
    this.fontStyle,
    this.prefixIcon,         // updated
    this.suffixIcon,
    this.prefixSvgIconPath,  // updated
    this.suffixSvgIconPath,
    this.iconSize,
    this.iconColor,
    this.gap,
    this.contentAlignment,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.isRounded = false,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorder = borderSide ??
        BorderSide(
          color: foregroundColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 1.5,
        );

    final buttonShape = shape ??
        RoundedRectangleBorder(
          borderRadius: isRounded
              ? (borderRadius ?? BorderRadius.circular(height != null ? height! / 2 : 24))
              : (borderRadius ?? BorderRadius.circular(8)),
          side: effectiveBorder,
        );

    final mergedTextStyle =
    (textStyle ?? Theme.of(context).textTheme.labelLarge ?? const TextStyle())
        .copyWith(
      fontSize: fontSize,
      color: textColor ?? foregroundColor ?? Theme.of(context).primaryColor,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
    );

    Widget? buildIcon(String? svg, Widget? widget) {
      if (svg != null) {
        return SvgPicture.asset(
          svg,
          width: iconSize,
          height: iconSize,
          colorFilter:
          iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
        );
      } else if (widget != null) {
        return IconTheme(
          data: IconThemeData(size: iconSize, color: iconColor ?? foregroundColor),
          child: widget,
        );
      }
      return null;
    }

    final Widget? prefix = buildIcon(prefixSvgIconPath, prefixIcon);
    final Widget? suffix = buildIcon(suffixSvgIconPath, suffixIcon);

    Widget finalChild = child ??
        Text(
          buttonText ?? '',
          style: mergedTextStyle,
        );

    if (prefix != null || suffix != null) {
      final rowChildren = <Widget>[];

      if (prefix != null) {
        rowChildren.add(prefix);
        if (gap != null) {
          rowChildren.add(SizedBox(width: gap));
        } else {
          rowChildren.add(const SizedBox(width: 8)); // default gap
        }
      }

      rowChildren.add(finalChild);

      if (suffix != null) {
        if (gap != null) {
          rowChildren.add(SizedBox(width: gap));
        } else {
          rowChildren.add(const SizedBox(width: 8)); // default gap
        }
        rowChildren.add(suffix);
      }

      finalChild = Row(
        mainAxisAlignment: contentAlignment ?? MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: rowChildren,
      );
    }

    return Container(
      margin: margin,
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? Theme.of(context).primaryColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation ?? (hasShadow ? 2 : 0),
          side: effectiveBorder,
          shape: buttonShape,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: finalChild,
      ),
    );
  }
}
*/




import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Widget? child;

  // Appearance
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? disabledForegroundColor;
  final Color? overlayColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  // Dimensions
  final double? width;
  final double? height;
  final double? elevation;

  // Padding and Margin
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  // Shape
  final BorderRadiusGeometry? borderRadius;
  final double? borderWidth;
  final BorderSide? borderSide;
  final OutlinedBorder? shape;

  // Text style
  final TextStyle? textStyle;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle? fontStyle;

  // Icons
  final Widget? prefixIcon;              // <-- renamed from icons
  final Widget? suffixIcon;
  final String? prefixSvgIconPath;      // <-- renamed from svgIconPath
  final String? suffixSvgIconPath;
  final double? iconSize;
  final Color? iconColor;
  final double? gap;
  final MainAxisAlignment? contentAlignment;

  // States
  final bool isDisabled;
  final bool isFullWidth;
  final bool isRounded;
  final bool hasShadow;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.child,
    this.foregroundColor,
    this.backgroundColor,
    this.disabledForegroundColor,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.width,
    this.height,
    this.elevation,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth,
    this.borderSide,
    this.shape,
    this.textStyle,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.letterSpacing,
    this.fontFamily,
    this.fontStyle,
    this.prefixIcon,         // updated
    this.suffixIcon,
    this.prefixSvgIconPath,  // updated
    this.suffixSvgIconPath,
    this.iconSize,
    this.iconColor,
    this.gap,
    this.contentAlignment,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.isRounded = false,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorder = borderSide ??
        BorderSide(
          color: foregroundColor ?? Theme.of(context).primaryColor,
          width: borderWidth ?? 1.5,
        );

    final buttonShape = shape ??
        RoundedRectangleBorder(
          borderRadius: isRounded
              ? (borderRadius ?? BorderRadius.circular(height != null ? height! / 2 : 24))
              : (borderRadius ?? BorderRadius.circular(8)),
          side: effectiveBorder,
        );

    final mergedTextStyle =
    (textStyle ?? Theme.of(context).textTheme.labelLarge ?? const TextStyle())
        .copyWith(
      fontSize: fontSize,
      color: textColor ?? foregroundColor ?? Theme.of(context).primaryColor,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
    );

    Widget? buildIcon(String? svg, Widget? widget) {
      if (svg != null) {
        return SvgPicture.asset(
          svg,
          width: iconSize,
          height: iconSize,
          colorFilter:
          iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
        );
      } else if (widget != null) {
        return IconTheme(
          data: IconThemeData(size: iconSize, color: iconColor ?? foregroundColor),
          child: widget,
        );
      }
      return null;
    }

    final Widget? prefix = buildIcon(prefixSvgIconPath, prefixIcon);
    final Widget? suffix = buildIcon(suffixSvgIconPath, suffixIcon);

    Widget finalChild = child ??
        Text(
          buttonText ?? '',
          style: mergedTextStyle,
        );

    // Ensure prefix icon is placed at the far left
    if (prefix != null || suffix != null) {
      final rowChildren = <Widget>[];

      // Prefix icon on the far left
      if (prefix != null) {
        rowChildren.add(prefix);
        if (gap != null) {
          rowChildren.add(SizedBox(width: gap));
        } else {
          rowChildren.add(const SizedBox(width: 8)); // default gap
        }
      }

      // Add the text (centered)
      rowChildren.add(Expanded(child: Align(
        alignment: Alignment.center,
        child: finalChild,
      )));

      // Suffix icon on the far right
      if (suffix != null) {
        if (gap != null) {
          rowChildren.add(SizedBox(width: gap));
        } else {
          rowChildren.add(const SizedBox(width: 8)); // default gap
        }
        rowChildren.add(suffix);
      }

      finalChild = Row(
        mainAxisAlignment: contentAlignment ?? MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: rowChildren,
      );
    }

    return Container(
      margin: margin,
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? Theme.of(context).primaryColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation ?? (hasShadow ? 2 : 0),
          side: effectiveBorder,
          shape: buttonShape,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: finalChild,
      ),
    );
  }
}
