import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_admin/models/studentInfoModel.dart';
import 'package:graduate_plus_admin/utilities/appColors.dart';
import 'package:graduate_plus_admin/utilities/commonButton.dart';

class UploadStudentInfoScreenView extends StatefulWidget {
  const UploadStudentInfoScreenView({super.key});

  @override
  State<UploadStudentInfoScreenView> createState() =>
      _UploadStudentInfoScreenViewState();
}

class _UploadStudentInfoScreenViewState
    extends State<UploadStudentInfoScreenView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? nameError, emailError, phoneError, addressError, passwordError;
  final DatabaseReference _database = FirebaseDatabase.instance.ref("students");

  bool _isLoading = false; // Loading state variable

  Future<void> _saveStudentInfo() async {
    setState(() {
      nameError = nameController.text.trim().isEmpty ? "Required field" : null;
      emailError =
          emailController.text.trim().isEmpty
              ? "Required field"
              : !RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(emailController.text.trim())
              ? "Enter a valid email"
              : null;
      phoneError =
          phoneController.text.trim().isEmpty ? "Required field" : null;
      addressError =
          addressController.text.trim().isEmpty ? "Required field" : null;
      passwordError =
          passwordController.text.trim().isEmpty
              ? "Required field"
              : passwordController.text.trim().length < 6
              ? "Password must be at least 6 characters"
              : null;
    });

    if (_formKey.currentState!.validate() &&
        nameError == null &&
        emailError == null &&
        phoneError == null &&
        addressError == null &&
        passwordError == null) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      try {
        String studentId = DateTime.now().millisecondsSinceEpoch.toString();

        StudentInfoModel student = StudentInfoModel(
          studentId: studentId,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          address: addressController.text.trim(),
          password: passwordController.text.trim(),
        );

        await _database.child(studentId).set(student.toJson());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Student Info Saved Successfully!")),
        );
        _clearForm();
      } catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: Unable to save data")));
      } finally {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    passwordController.clear();

    setState(() {
      nameError = null;
      emailError = null;
      phoneError = null;
      addressError = null;
      passwordError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
        title: Row(
          children: [Image.asset('assets/images/bcuLogo.png', height: 40.0)],
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Student Info',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        buildTextField(
                          nameController,
                          "Student Name",
                          "Enter full name",
                          Icons.person,
                          errorText: nameError,
                        ),
                        buildTextField(
                          emailController,
                          "Email",
                          "Enter email",
                          Icons.email,
                          errorText: emailError,
                          isEmail: true,
                        ),
                        buildTextField(
                          passwordController,
                          "Password",
                          "Enter password",
                          Icons.lock,
                          errorText: passwordError,
                          isPassword: true,
                        ),
                        buildTextField(
                          phoneController,
                          "Phone",
                          "Enter phone number",
                          Icons.phone,
                          errorText: phoneError,
                          isNumber: true,
                        ),
                        buildTextField(
                          addressController,
                          "Address",
                          "Enter address",
                          Icons.home,
                          errorText: addressError,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap:
                        _isLoading
                            ? null
                            : () {
                              _saveStudentInfo();
                            },
                    child: commonButton(
                      context: context,
                      label: "Save Student Info",
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(
                0.5,
              ), // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white, // White spinner
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String label,
    String hint,
    IconData icon, {
    bool isNumber = false,
    bool isEmail = false,
    bool isPassword = false,
    int maxLines = 1,
    String? errorText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            borderSide: BorderSide(color: Colors.grey), // Border color
          ),
          errorText: errorText,
          prefixIcon: Icon(icon),
        ),
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
      ),
    );
  }
}
