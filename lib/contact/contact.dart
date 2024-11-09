import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wkumsurh/major/widgets/hmajor_card.dart';
import 'package:wkumsurh/major/widgets/hmajor_card_big.dart';

import '../constants/htexts.dart';
import '../login/widgets/htextfield.dart';
import '../navbar.dart';
import '../widgets/back_ground.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLargeScreen = screenWidth > 700;
    return Scaffold(
      body: Stack(
        children: [
          // Background Layer
          BackGround(screenWidth: screenWidth, screenHeight: screenHeight),

          // Navbar Layer
          Positioned(
            width: screenWidth,
            height: screenHeight * 0.2,
            child: Navbar(screenWidth: screenWidth),
          ),

          // Main Content Layer
          Positioned(
            top: isLargeScreen? screenHeight * 0.3:screenHeight * 0.2,
            left: isLargeScreen ? screenWidth * 0.1 : 0.2,
            right: isLargeScreen ? screenWidth * 0.1 : 0.2,
            height: screenHeight * 0.8,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: isLargeScreen
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column: Contact Us Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Color(0xFF00484B),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'We’re here to help! Feel free to reach out with any questions, suggestions, or feedback. We’d love to hear from you!',
                          style: TextStyle(
                            color: Color(0xFF00484B),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            width: 300,
                            height: 190,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF00484B),
                              width: 2.0,
                            ),
                            color: Color(0x55C3F9FB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text('Contact Via'),),
                                Row(
                                  children: [
                                    Icon(Icons.map),
                                    SizedBox(width: 15,),
                                    Expanded(child: Text('@wolkiteunimusstuuni')),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.label_important_outline_sharp),
                                    SizedBox(width: 15,),
                                    Expanded(child: Text('@wolkiteunimusstuuni')),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.pages),
                                    SizedBox(width: 15,),
                                    Expanded(child: Text('@wolkiteunimusstuuni')),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(width: 15,),
                                    Expanded(child: Text('@wolkiteunimusstuuni')),
                                  ],
                                ),
                                SizedBox(height: 10,),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ),

                  // Right Column: Contact Form
                  SizedBox(width: 20),
                  SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.4,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF00484B),
                            width: 2.0,
                          ),
                          color: Color(0x55C3F9FB),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Share your idea',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 20),

                              // Email Field
                              HTextField(
                                icon: Icons.email,
                                name: 'Email',
                                description: 'Please enter your email',
                              ),
                              SizedBox(height: 10),

                              // Phone Number Field
                              HTextField(
                                icon: Icons.phone_forwarded,
                                name: 'Phone number',
                                description: 'Please enter your phone number',
                              ),
                              SizedBox(height: 10),

                              // Idea/Message Field with wider textarea
                              Text(
                                'Your Idea',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),

                              // Text Area for Idea/Message
                              TextFormField(
                                maxLines: 6, // Set max lines for larger area
                                decoration: InputDecoration(
                                  hintText: 'Please share your thoughts or feedback here',
                                  filled: true,
                                  fillColor: Color(0x55C3F9FB), // Light background color
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              // Send Button
                              Center(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFFC3F9FB),
                                    side: BorderSide(color: Color(0xFF00484B), width: 1),
                                  ),
                                  child: Text(
                                    'Send now',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF00484B),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Color(0xFF00484B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We’re here to help! Feel free to reach out with any questions, suggestions, or feedback. We’d love to hear from you!',
                    style: TextStyle(
                      color: Color(0xFF00484B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 20),
                  // Right Column: Contact Form
                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight*0.7,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF00484B),
                        width: 2.0,
                      ),
                      color: Color(0x55C3F9FB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share your idea',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Email Field
                          HTextField(
                            icon: Icons.email,
                            name: 'Email',
                            description: 'Please enter your email',
                          ),
                          SizedBox(height: 10),

                          // Phone Number Field
                          HTextField(
                            icon: Icons.phone_forwarded,
                            name: 'Phone number',
                            description: 'Please enter your phone number',
                          ),
                          SizedBox(height: 10),

                          // Idea/Message Field with wider textarea
                          Text(
                            'Your Idea',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                maxLines: 8, // Increases height for a wider text area
                                decoration: InputDecoration(
                                  hintText: 'Please share your thoughts or feedback here',
                                  filled: true,
                                  fillColor: Color(0x55C3F9FB), // Light background color
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFF00484B), // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFC3F9FB),
                              side: BorderSide(color: Color(0xFF00484B), width: 1),
                            ),
                            child: Text(
                              'Send now',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF00484B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                        width: 300,
                        height: 190,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF00484B),
                          width: 2.0,
                        ),
                        color: Color(0x55C3F9FB),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        child: const Column(
                          children: [
                            Center(child: Text('Contact Via'),),
                            Row(
                              children: [
                                Icon(Icons.map),
                                SizedBox(width: 15,),
                                Expanded(child: Text('@wolkiteunimusstuuni')),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.label_important_outline_sharp),
                                SizedBox(width: 15,),
                                Expanded(child: Text('@wolkiteunimusstuuni')),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.pages),
                                SizedBox(width: 15,),
                                Expanded(child: Text('@wolkiteunimusstuuni')),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(width: 15,),
                                Expanded(child: Text('@wolkiteunimusstuuni')),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
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

