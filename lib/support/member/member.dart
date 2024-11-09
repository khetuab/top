import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/support/member/widgets/member_big_card.dart';
import 'package:wkumsurh/support/member/widgets/member_small_card.dart';
import '../../navbar.dart';
import '../../widgets/back_ground.dart';


class Member extends StatelessWidget {
  const Member({super.key});

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
                      'Become a Member',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Join our Union and support our mission while enjoying exclusive benefits. Choose a membership level that suits you and help us create a thriving community for all.',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 20,),
                    MemberBigCard(screenWidth: screenWidth, image: 'assets/supportLevel/platinum.png', majorName: 'Platinum Member - 120 Birr/month', majorDescription: 'Our highest level! As a Platinum Member, you’ll enjoy premium benefits, exclusive event invitations, and the chance to make a significant impact within our community.', buttonText: 'Join as Platinum Member', icon: 'assets/supporticons/plat.webp',),
                    SizedBox(height: 20,),
                    MemberBigCard(screenWidth: screenWidth, image: 'assets/supportLevel/Gold-Membership.png', majorName: 'Gold Member - 100 Birr/month', majorDescription: 'Unlock valuable perks and priority access to our events with a Gold Membership.Join us at this level and enjoy being part of our close-knit, active community.', buttonText: 'Join as Gold Member', icon: 'assets/supporticons/gold.webp'),
                    SizedBox(height: 20,),
                    MemberBigCard(screenWidth: screenWidth, image: 'assets/supportLevel/Silver-Membership.png', majorName: 'Silver Member - 80 Birr/month', majorDescription: 'The Silver Membership offers solid benefits at an affordable rate. Enjoy access to most events, resources, and community discussions to help you connect and grow.', buttonText: 'Join as Silver Member', icon: 'assets/supporticons/silver.webp'),
                    SizedBox(height: 20,),
                    MemberBigCard(screenWidth: screenWidth, image: 'assets/supportLevel/bronze.png', majorName: 'Bronze Member - 50 Birr/month', majorDescription: 'Get started with a Bronze Membership to gain basic access to our community events and resources. A great option for those just beginning their journey with us.', buttonText: 'Join as Bronze Member', icon: 'assets/supporticons/bronze.png'),
                    SizedBox(height: 20,),
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
                      'Become a Member',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Join our Union and support our mission while enjoying exclusive benefits. Choose a membership level that suits you and help us create a thriving community for all.',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 20,),
                    MemberSmallCard(screenWidth: screenWidth, image: 'assets/supportLevel/platinum.png', majorName: 'Platinum Member - 120 Birr/month', majorDescription: 'Our highest level! As a Platinum Member, you’ll enjoy premium benefits, exclusive event invitations, and the chance to make a significant impact within our community.', buttonText: 'Join as Platinum Member', icon: 'assets/supporticons/plat.webp',),
                    SizedBox(height: 20,),
                    MemberSmallCard(screenWidth: screenWidth, image: 'assets/supportLevel/Gold-Membership.png', majorName: 'Gold Member - 100 Birr/month', majorDescription: 'Unlock valuable perks and priority access to our events with a Gold Membership.Join us at this level and enjoy being part of our close-knit, active community.', buttonText: 'Join as Gold Member', icon: 'assets/supporticons/gold.webp'),
                    SizedBox(height: 20,),
                    MemberSmallCard(screenWidth: screenWidth, image: 'assets/supportLevel/Silver-Membership.png', majorName: 'Silver Member - 80 Birr/month', majorDescription: 'The Silver Membership offers solid benefits at an affordable rate. Enjoy access to most events, resources, and community discussions to help you connect and grow.', buttonText: 'Join as Silver Member', icon: 'assets/supporticons/silver.webp'),
                    SizedBox(height: 20,),
                    MemberSmallCard(screenWidth: screenWidth, image: 'assets/supportLevel/bronze.png', majorName: 'Bronze Member - 50 Birr/month', majorDescription: 'Get started with a Bronze Membership to gain basic access to our community events and resources. A great option for those just beginning their journey with us.', buttonText: 'Join as Bronze Member', icon: 'assets/supporticons/bronze.png'),
                    SizedBox(height: 20,),
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

