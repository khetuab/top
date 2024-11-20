
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/login/login.dart';
import 'package:wkumsurh/widgets/back_ground.dart';
import 'package:wkumsurh/widgets/hlogo.dart';

import 'navbar.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          BackGround(screenWidth: screenWidth, screenHeight: screenHeight),
          HLogo(screenWidth: screenWidth, screenHeight: screenHeight),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                right: screenWidth < 700 ? 20 : 40,
                bottom: screenHeight < 700 ? 20 : 40,
              ),
              child: Image.asset(
                'assets/logo/qalam.png',
                width: screenWidth < 700 ? 300 : 300,
                height: screenHeight < 700 ? 200 : 300,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            width: screenWidth,
            height: screenHeight * 0.2,
            child: Navbar(screenWidth: screenWidth),
          ),
          Positioned(
            top: screenHeight*0.3,
            left: screenWidth * 0.1,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Wolkite University ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth > 600 ? 38 : 24,
                        fontFamily: 'sans-serif',
                        color: Color(0xFF00484B),
                      ),
                    ),
                    TextSpan(
                      text: 'Muslim',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth > 600 ? 38 : 24,
                        fontFamily: 'sans-serif',
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '\nStudents Union',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth > 600 ? 38 : 24,
                        fontFamily: 'sans-serif',
                        color:  Color(0xFF00484B),
                      ),
                    ),
                    TextSpan(
                      text: '\n\n\n We Strive For Islamic \n Wisdom',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth > 600 ? 34 : 20,
                        fontFamily: 'sans-serif',
                        color:  Color(0xFFffffff),
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.2,
            bottom:screenWidth < 600? screenHeight * 0.4:screenHeight * 0.3,
            child: OutlinedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Color(0xFFC3F9FB),
                side: BorderSide(color: Color(0xFF00484B), width: 2),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: screenWidth > 700 ? 24 : 20,
                  color: Color(0xFF00484B),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
