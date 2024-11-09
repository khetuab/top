
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wkumsurh/constants/hvalidator.dart';

import '../../login/widgets/htextfield.dart';

final _formKey = GlobalKey<FormState>();
class HFormRegister extends StatelessWidget {
   HFormRegister({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Register',style: TextStyle(color: Color(0xFF00484B),fontSize: 30,fontWeight: FontWeight.bold),),),
            HTextField(name: 'full name', icon: Icons.person,description: 'Enter your name', validator: (value)=> HValidator.validateEmptyText('full name', value),controller: nameController,),
            HTextField(name: 'phone number', icon: Icons.phone,description: 'Enter your phone number',controller: phoneController,validator: (value)=> HValidator.validatePhoneNumber(value),),
            HTextField(name: 'email', icon: Icons.email,description: 'Enter your email',controller: emailController,validator:(value)=>HValidator.validateEmail(value),),
            HTextField(name: 'password', icon: Icons.password,description: 'Enter your password',controller: passwordController,validator: (value)=> HValidator.validatePassword(value),),
            HTextField(name: 'confirm password', icon: Icons.password,description: 'repeat your password',controller: confirmPasswordController,validator:(value)=> HValidator.validatePassword(value),),
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
