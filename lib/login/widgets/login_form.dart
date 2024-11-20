import 'package:flutter/material.dart';
import 'package:wkumsurh/backend/controllers/auth_controller.dart';
import 'package:wkumsurh/constants/hvalidator.dart';

import '../../register/register.dart';
import 'htextfield.dart';

class HFormLogin extends StatefulWidget {
  final double screenWidth;

  const HFormLogin({super.key, required this.screenWidth});

  @override
  State<HFormLogin> createState() => _HFormLoginState();
}

class _HFormLoginState extends State<HFormLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/ahlen.png',
              width: widget.screenWidth * 0.3,
              height: screenHeight * 0.1,
              color: Colors.white,
            ),
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFF00484B),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            HTextField(
              name: 'email',
              controller: emailController,
              icon: Icons.email_outlined,
              description: 'Enter your email',
              validator: (value) => HValidator.validateEmail(value),
            ),
            HTextField(
              validator: (value) => HValidator.validatePassword(value),
              name: 'password',
              controller: passwordController,
              icon: Icons.password,
              description: 'Enter your password',
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: widget.screenWidth > 700 ? 400 : 270,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF00484B),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthController.instance.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFC3F9FB),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                // Forgot password functionality
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Forgot password?'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not registered? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: Text('Create Account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
