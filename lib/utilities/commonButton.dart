import 'package:flutter/material.dart';
import 'package:graduate_plus_admin/utilities/appColors.dart';
import 'package:graduate_plus_admin/utilities/textStyles.dart';

/// A reusable button widget with a consistent design across the app.
///
/// This button spans the full width of its parent container and has
/// rounded corners with a dark blue background.
///
/// Parameters:
/// - `context`: Required for obtaining screen width.
/// - `label`: Text to be displayed inside the button.
Widget commonButton({required BuildContext context, required String label}) {
  return Container(
    height: 48, // Fixed button height.
    width: MediaQuery.of(context).size.width, // Full width of the screen.
    decoration: BoxDecoration(
      color: darkBlue, // Background color for the button.
      borderRadius: BorderRadius.circular(8), // Rounded corners.
    ),
    child: Center(
      child: Text(
        label, // Display the button label text.
        style: textStyleH2(whiteColor), // Applies text style from utilities.
      ),
    ),
  );
}
