import 'package:flutter/material.dart';
import 'package:graduate_plus_admin/utilities/appColors.dart';

/// Returns a bold text style with the specified color.
/// Suitable for titles, important labels, and emphasis.
TextStyle textStyleBold(Color color) {
  return TextStyle(
    fontSize: 16, // Standard readable size
    fontWeight: FontWeight.bold, // Makes text stand out
    color: color, // Customizable text color
  );
}

/// Returns an H2-styled text with medium weight.
/// Ideal for section headings or prominent labels.
TextStyle textStyleH2(Color color) {
  return TextStyle(
    fontSize: 18, // Slightly larger font for emphasis
    fontWeight: FontWeight.w500, // Medium weight for better visibility
    color: color, // Customizable text color
  );
}

/// Returns an H3-styled bold text.
/// Best suited for large headers, titles, or impactful text.
TextStyle textStyleH3(Color color) {
  return TextStyle(
    fontSize: 28, // Large size for major headings
    fontWeight: FontWeight.bold, // Ensures strong emphasis
    color: color, // Customizable text color
  );
}

/// Returns a light-weight text style.
/// Ideal for secondary text, descriptions, or captions.
TextStyle textStyleLight(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w300, // Lighter font for subtle appearance
    color: blackColor, // Default color set to black
  );
}

/// Returns a regular text style.
/// Suitable for body text or standard content.
TextStyle textStyleRegular() {
  return TextStyle(
    color: blackColor, // Default text color for readability
  );
}
