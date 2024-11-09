import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/constants/hvalidator.dart';
import '../../login/widgets/htextfield.dart';
import '../../navbar.dart';
import '../../widgets/back_ground.dart';

class MajorRegister extends StatelessWidget {
   MajorRegister({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register for Da’wa',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Complete your registration to join the Da’wa major and connect with a supportive community dedicated to learning, growth, and positive impact.',
                      style: TextStyle(
                          color: Color(0xFF00484B),
                          fontSize: isLargeScreen ? 20 : 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF00484B)),
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Color(0x55C3F9FB),
                            Color(0x9900484B),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: isLargeScreen
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                HTextField(
                                  validator: (value)=>HValidator.validateEmptyText('Full name', value),
                                  name: 'Full name',
                                  controller: nameController,
                                  icon: Icons.person,
                                  description: 'write your full name',
                                ),
                                SizedBox(height: 10),
                                HTextField(
                                  validator: (value)=>HValidator.validatePhoneNumber(value),
                                  controller: phoneController,
                                  name: 'Phone Number',
                                  icon: Icons.phone,
                                  description: 'write your Phone Number',
                                ),
                                SizedBox(height: 10),
                                HTextField(
                                  validator: (value)=>HValidator.validateEmail(value),
                                  controller: emailController,
                                  name: 'Email',
                                  icon: Icons.email,
                                  description: 'write your Email',
                                ),
                                SizedBox(height: 10),
                                HTextField(
                                  controller: idController,
                                  validator: (value)=>HValidator.validateEmptyText('ID number', value),
                                  name: 'ID number',
                                  icon: Icons.numbers,
                                  description: 'write your ID number',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                TextFormField(
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    hintText: 'Your comment',
                                    filled: true,
                                    fillColor: Color(0x55C3F9FB),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFF00484B),
                                        width: 1.5,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFF00484B),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFF00484B),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                    width: screenWidth > 700?400:270,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color(0xFF00484B)
                                        ),
                                        child: TextButton(onPressed: (){}, child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFFC3F9FB)),)))
                                ),

                              ],
                            ),
                          ),
                        ],
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HTextField(
                              validator: (value)=>HValidator.validateEmptyText('Full name', value),
                              name: 'Full name',
                              controller: nameController,
                              icon: Icons.person,
                              description: 'write your full name',
                            ),
                            SizedBox(height: 10),
                            HTextField(
                              validator: (value)=>HValidator.validatePhoneNumber(value),
                              controller: phoneController,
                              name: 'Phone Number',
                              icon: Icons.phone,
                              description: 'write your Phone Number',
                            ),
                            SizedBox(height: 10),
                            HTextField(
                              validator: (value)=>HValidator.validateEmail(value),
                              controller: emailController,
                              name: 'Email',
                              icon: Icons.email,
                              description: 'write your Email',
                            ),
                            SizedBox(height: 10),
                            HTextField(
                              controller: idController,
                              validator: (value)=>HValidator.validateEmptyText('ID number', value),
                              name: 'ID number',
                              icon: Icons.numbers,
                              description: 'write your ID number',
                            ),
                          ]
                      ),
                    ),
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
