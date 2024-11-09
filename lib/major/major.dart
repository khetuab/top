import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/major/widgets/hmajor_card.dart';
import 'package:wkumsurh/major/widgets/hmajor_card_big.dart';

import '../constants/htexts.dart';
import '../navbar.dart';
import '../widgets/back_ground.dart';

class Major extends StatelessWidget {
  const Major({super.key});

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
                ? Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Majors',
                            style: TextStyle(
                                color: Color(0xFF00484B),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Explore the different units within our Muslim Students Union. Choose the one that resonates with your goals and interests, and join us in contributing to our community.',
                            style: TextStyle(
                                color: Color(0xFF00484B),
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(height: 40),
                          HMajorCardBig(screenWidth: screenWidth, image: 'assets/majors/dawa.jpg', majorName: 'Daa\'wa', majorDescription: Htexts.dawaDescription,),
                          SizedBox(height: 30,),
                          HMajorCardBig(screenWidth: screenWidth, image: 'assets/majors/economy.jpg', majorName: 'Economy', majorDescription: Htexts.economyDescription,),
                          SizedBox(height: 30,),
                          HMajorCardBig(screenWidth: screenWidth, image: 'assets/majors/acadamy.jpg', majorName: 'Academy', majorDescription: Htexts.academyDescription,),
                          SizedBox(height: 30,),
                          HMajorCardBig(screenWidth: screenWidth, image: 'assets/majors/social.webp', majorName: 'Social', majorDescription: Htexts.socialDescription,),
                          SizedBox(height: 80,),

                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Our Majors',
                            style: TextStyle(
                                color: Color(0xFF00484B),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Explore the different units within our Muslim Students Union. Choose the one that resonates with your goals and interests, and join us in contributing to our community.',
                            style: TextStyle(
                              color: Color(0xFF00484B),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(height: 20,),
                          HMajorCard(screenWidth: screenWidth, image: 'assets/majors/dawa.jpg', majorName: 'Daa\'wa', majorDescription: Htexts.dawaDescription,),
                          SizedBox(height: 30,),
                          HMajorCard(screenWidth: screenWidth, image: 'assets/majors/economy.jpg', majorName: 'Economy', majorDescription: Htexts.economyDescription,),
                          SizedBox(height: 30,),
                          HMajorCard(screenWidth: screenWidth, image: 'assets/majors/acadamy.jpg', majorName: 'Academy', majorDescription: Htexts.academyDescription,),
                          SizedBox(height: 30,),
                          HMajorCard(screenWidth: screenWidth, image: 'assets/majors/social.webp', majorName: 'Social', majorDescription: Htexts.socialDescription,),
                          SizedBox(height: 80,),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

