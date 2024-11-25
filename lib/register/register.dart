import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/register/widgets/hform_register.dart';
import '../navbar.dart';
import '../widgets/back_ground.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/logo/logo.png'),
                  ),
                  const Spacer(),

                  Text('WKUMSU',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ),)
                ],
              ),
            ),
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
                  child: HFormRegister(screenWidth: screenWidth),
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
                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.58,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF00484B), // Border color
                        width: 2.0, // Border width
                      ),
                      color: Color(0x55C3F9FB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: HFormRegister(screenWidth: screenWidth),
                  ),
                  const SizedBox(height: 300,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
