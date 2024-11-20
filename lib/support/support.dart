import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navbar.dart';
import '../widgets/back_ground.dart';
import 'member/member.dart';

class Support extends StatelessWidget {
  const Support({super.key});

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
                      'Support Us',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Your support helps us create a welcoming and empowering environment for all students. From organizing community events to providing educational resources, every contribution makes a difference.',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    HSupportCard(screenWidth: screenWidth, title: 'Donate', description: 'Help us fund student programs, events, and resources by making a donation.Every contribution,no matter the size, goes directly to supporting our initiatives', buttonname: 'Donate now',),
                    SizedBox(width: 20,),
                    HSupportCard(screenWidth: screenWidth, title: 'Sponsorship', description: 'Partner with us by sponsoring an event.Sponsorship helps us create impactful experiences for our community while giving your organization positive exposure.', buttonname: 'Sponsor now',),
                  ],
                ),
                    SizedBox(height: 20,),
                    HSupportCard(screenWidth: screenWidth, title: 'Membership', description: 'Become part of a supportive community dedicated to personal growth, learning, and making a positive impact. Join us to connect with fellow students, access exclusive events, and contribute to our shared mission', buttonname: 'Join now',),
                    SizedBox(height: 50,),
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
                      'Support Us',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Your support helps us create a welcoming and empowering environment for all students. From organizing community events to providing educational resources, every contribution makes a difference.',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        HSupportCard(screenWidth: screenWidth, title: 'Donate', description: 'Help us fund student programs, events, and resources by making a donation.Every contribution,no matter the size, goes directly to supporting our initiatives', buttonname: 'Donate now',),
                        SizedBox(height: 20,),
                        HSupportCard(screenWidth: screenWidth, title: 'Sponsorship', description: 'Partner with us by sponsoring an event.Sponsorship helps us create impactful experiences for our community while giving your organization positive exposure.', buttonname: 'Sponsor now',),
                        SizedBox(height: 20,),
                        HSupportCard(screenWidth: screenWidth, title: 'Membership', description: 'Become part of a supportive community dedicated to personal growth, learning, and making a positive impact. Join us to connect with fellow students, access exclusive events, and contribute to our shared mission', buttonname: 'Join now',),
                        SizedBox(height: 50,),
                      ],
                    )

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

class HSupportCard extends StatelessWidget {
  const HSupportCard({
    super.key,
    required this.screenWidth, required this.title, required this.description, required this.buttonname,
  });

  final double screenWidth;
  final String title;
  final String description;
  final String buttonname;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth>700? screenWidth *0.35:screenWidth*0.7,
      height: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF00484B), // Border color
            width: 2.0,          // Border width
          ),
          color: Color(0xaa2d999d),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(
                0xaa061e1f)),),SizedBox(height: 5,),
          Expanded(child: Text(description,maxLines: 5,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.white),)),
          OutlinedButton(
            onPressed: () {
              _registerUserToMember();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Member()));
            },            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0x55C3F9FB),
              side: BorderSide(color: Color(0xFF00484B), width: 1),
            ),
            child: Text(
              buttonname,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF00484B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _registerUserToMember(){

  }
}

