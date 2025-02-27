import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum BlaButtonType { primary, secondary }

// A custom button widget that supports primary and secondary styles, with optional icons
class BlaButton extends StatelessWidget {
  final BlaButtonType buttonType;
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isHovered;

  const BlaButton({
    super.key,
    required this.label,
    required this.buttonType,
    this.onPressed,
    this.icon,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getBackgroundColor();
    Color textColor = _getTextColor();
    Color iconColor = textColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: BlaSpacings.m,
          vertical: BlaSpacings.m,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radiusLarge),
        ),
        elevation: isHovered ? 6.0 : 2.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) // Display icon if provided
              Icon(
                icon,
                color: iconColor,
                size: 20.0,
              ),
            if (icon != null)
              SizedBox(width: BlaSpacings.s), // Add spacing if icon is present
            Text(
              label,
              style: BlaTextStyles.button.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  // Method to get the background color based on button type and hover state
  Color _getBackgroundColor() {
    return buttonType == BlaButtonType.primary
        ? (isHovered ? BlaColors.neutral : BlaColors.primary)
        : (isHovered ? BlaColors.backgroundAccent : BlaColors.white);
  }

  // Method to get the text color based on button type
  Color _getTextColor() {
    return buttonType == BlaButtonType.primary
        ? BlaColors.white
        : BlaColors.primary;
  }
}
