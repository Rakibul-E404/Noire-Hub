import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_noire_hub/utils/app_colors.dart';

Widget buildSocialButton({
  String? icon, // For text icons (G, f, etc.)
  String? svgIconPath, // For SVG icons
  String? imageIconPath, // For image icons (PNG, JPG, etc.)
  Widget? iconWidget, // For custom icon widgets
  required String text,
  required Color backgroundColor,
  required Color textColor,
  Color? iconColor,
  double iconSize = 20,
  BoxFit imageFit = BoxFit.contain,
  double leftPadding = 50.0, // Fixed left padding for content
  VoidCallback? onPressed,
}) {
  Widget? displayIcon;

  // Determine which icon to show (priority: iconWidget > imageIcon > svgIcon > text icon)
  if (iconWidget != null) {
    displayIcon = iconWidget;
  } else if (imageIconPath != null) {
    displayIcon = Container(
      width: iconSize,
      height: iconSize,
      alignment: Alignment.center,
      child: Image.asset(
        imageIconPath,
        width: iconSize,
        height: iconSize,
        fit: imageFit,
        color: iconColor,
      ),
    );
  } else if (svgIconPath != null) {
    displayIcon = Container(
      width: iconSize,
      height: iconSize,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        svgIconPath,
        width: iconSize,
        height: iconSize,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor, BlendMode.srcIn)
            : null,
      ),
    );
  } else if (icon != null && icon.isNotEmpty) {
    displayIcon = Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: iconColor ?? Colors.transparent,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        icon,
        style: TextStyle(
          fontSize: iconSize * 0.7,
          fontWeight: FontWeight.bold,
          color: iconColor != null ? AppColors.whiteColor : AppColors.blackColor,
        ),
      ),
    );
  }

  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              // Fixed left padding
              SizedBox(width: leftPadding),

              // Icon (if present)
              if (displayIcon != null) displayIcon,
              if (displayIcon != null) const SizedBox(width: 12),

              // Text
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: displayIcon == null ? TextAlign.center : TextAlign.left,
                ),
              ),

              // Right padding to balance the left padding
              SizedBox(width: leftPadding),
            ],
          ),
        ),
      ),
    ),
  );
}