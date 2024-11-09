import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/constants/hvalidator.dart';

import '../../register/register.dart';
import 'htextfield.dart';

class HFormLogin extends StatelessWidget {
  const HFormLogin({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Color(0xFF00484B),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            HTextField(
              name: 'phone number',
              icon: Icons.phone,
              description: 'Enter your phone number', validator: (value)=> HValidator.validatePhoneNumber(value),
            ),
            HTextField(
              validator: (value)=> HValidator.validateEmail(value),
              name: 'password',
              icon: Icons.password,
              description: 'Enter your password',
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: screenWidth > 700 ? 400 : 270,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF00484B)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFFC3F9FB)),
                        )))),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot password?'),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not registered ? '),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text('Create Account')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
