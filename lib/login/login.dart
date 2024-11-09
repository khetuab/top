import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/login/widgets/login_form.dart';
import '../navbar.dart';
import '../widgets/back_ground.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLargeScreen = screenWidth > 700;

    return Scaffold(
      body: Stack(
        children: [
          BackGround(screenWidth: screenWidth, screenHeight: screenHeight),
          Positioned(
            width: screenWidth,
            height: screenHeight * 0.2,
            child: Navbar(screenWidth: screenWidth),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: isLargeScreen ? screenWidth * 0.1 : 0,
            right: isLargeScreen ? screenWidth * 0.1 : 0,
            height: screenHeight * 0.85,
            child: isLargeScreen
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/logo/login.webp',
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.3,
                ),
                Container(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.6,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF00484B), // Border color
                      width: 2.0, // Border width
                    ),
                    color: Color(0x55C3F9FB),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: HFormLogin(screenWidth: screenWidth),
                ),

              ],
            )
                : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/login.webp',
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.2,
                  ),
                  SizedBox(height: screenHeight * 0.02), // Gap between image and container
                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.5,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF00484B), // Border color
                        width: 2.0, // Border width
                      ),
                      color: Color(0x55C3F9FB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: HFormLogin(screenWidth: screenWidth),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
