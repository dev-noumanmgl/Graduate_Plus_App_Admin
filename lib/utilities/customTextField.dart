import 'package:flutter/material.dart';

/// A reusable custom text field widget for form input.
/// Provides a standard input field with customizable properties like
/// hint text, prefix icon, password visibility, and validation.
class CustomTextField extends StatelessWidget {
  /// Controller to manage the text input.
  final TextEditingController controller;

  /// Placeholder text displayed inside the text field.
  final String hintText;

  /// Optional icon displayed at the beginning of the text field.
  final IconData? prefixIcon;

  /// Determines whether the text should be obscured (e.g., for passwords).
  final bool obscureText;

  /// Validation function for form validation.
  /// Returns an error message string if validation fails, or null if valid.
  final String? Function(String?)? validator;

  /// Constructor to initialize required and optional properties.
  const CustomTextField({
    Key? key,
    required this.controller, // Controller is mandatory to manage input state.
    required this.hintText, // Hint text is required for better UX.
    this.prefixIcon, // Prefix icon is optional.
    this.obscureText = false, // Default is false (not obscured).
    this.validator, // Validator function for form validation.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Binds the text field with the controller.
      obscureText: obscureText, // Hides text if true (for passwords).
      decoration: InputDecoration(
        hintText: hintText, // Displays hint text inside the field.
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon)
            : null, // Adds icon if provided.
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Rounded corners for a smooth look.
        ),
        filled: true, // Enables background color filling.
        fillColor: Colors
            .grey.shade100, // Light grey background for better readability.
      ),
      validator: validator, // Uses provided validation logic.
    );
  }
}
