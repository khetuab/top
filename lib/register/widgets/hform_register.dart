
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login/widgets/htextfield.dart';


class HFormRegister extends StatelessWidget {
  const HFormRegister({
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
            Center(child: Text('Register',style: TextStyle(color: Color(0xFF00484B),fontSize: 30,fontWeight: FontWeight.bold),),),
            HTextField(name: 'full name', icon: Icons.person,description: 'Enter your name',),
            HTextField(name: 'phone number', icon: Icons.phone,description: 'Enter your phone number',),
            HTextField(name: 'email', icon: Icons.email,description: 'Enter your email',),
            HTextField(name: 'password', icon: Icons.password,description: 'Enter your password',),
            HTextField(name: 'confirm password', icon: Icons.password,description: 'repeat your password',),
            SizedBox(height: 30,),
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
    );
  }
}
