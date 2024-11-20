import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wkumsurh/backend/controllers/auth_controller.dart';
import 'package:wkumsurh/backend/controllers/user_controller.dart';
import 'package:wkumsurh/constants/hvalidator.dart';
import 'package:wkumsurh/login/login.dart';

import '../../login/widgets/htextfield.dart';
import '../../models/user_model.dart';

class HFormRegister extends StatefulWidget {
  final double screenWidth;

  const HFormRegister({super.key, required this.screenWidth});

  @override
  State<HFormRegister> createState() => _HFormRegisterState();
}

class _HFormRegisterState extends State<HFormRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final UserController controller = UserController.instance;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Color(0xFF00484B),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            HTextField(
              name: 'full name',
              icon: Icons.person,
              description: 'Enter your name',
              validator: (value) => HValidator.validateEmptyText('full name', value),
              controller: nameController,
            ),
            HTextField(
              name: 'phone number',
              icon: Icons.phone,
              description: 'Enter your phone number',
              controller: phoneController,
              validator: (value) => HValidator.validatePhoneNumber(value),
            ),
            HTextField(
              name: 'email',
              icon: Icons.email,
              description: 'Enter your email',
              controller: emailController,
              validator: (value) => HValidator.validateEmail(value),
            ),
            HTextField(
              name: 'address',
              icon: Icons.location_on_outlined,
              description: 'Enter your Address',
              controller: addressController,
              validator: (value) => HValidator.validateEmptyText('Address', value),
            ),
            HTextField(
              name: 'password',
              icon: Icons.password,
              description: 'Enter your password',
              controller: passwordController,
              validator: (value) => HValidator.validatePassword(value),
            ),
            HTextField(
              name: 'confirm password',
              icon: Icons.password,
              description: 'Repeat your password',
              controller: confirmPasswordController,
              validator: (value) {
                if (value != passwordController.text) {
                  return "Passwords do not match.";
                }
                return HValidator.validatePassword(value);
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              width: widget.screenWidth > 700 ? 400 : 270,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF00484B),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Attempt to register the user using AuthController
                      String? userId = await AuthController.instance.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (userId != null) {
                        // If registration is successful and userId is obtained
                        UserModel newUser = UserModel(
                          id: userId,
                          fullname: nameController.text.trim(),
                          email: emailController.text.trim(),
                          phoneNumber: phoneController.text.trim(),
                          adress: addressController.text.trim(),
                          profilePicture: AuthController.instance.userprofile.value, // Optional field example
                        );

                        // Add user data to Firestore using UserController
                        await controller.addUser(newUser);

                        // Notify user of successful registration or navigate
                        Get.snackbar("Success", "User registered successfully!");
                        Get.to(() => Login());
                      } else {
                        // Handle registration failure
                        Get.snackbar("Error", "Registration failed. Please try again.");
                      }
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFC3F9FB),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
