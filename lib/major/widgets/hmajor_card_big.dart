import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../register/major_register.dart';

class HMajorCardBig extends StatelessWidget {
  const HMajorCardBig({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.majorName,
    required this.majorDescription,
  });

  final double screenWidth;
  final String image;
  final String majorName;
  final String majorDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.8,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF00484B), // Border color
          width: 2.0,               // Border width
        ),
        color: Color(0x55C3F9FB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Container(
            width: 250,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Same radius for the image clipping
              child: Image.asset(
                image,
                fit: BoxFit.cover,        // Ensures the image covers the container
              ),
            ),
          ),


          SizedBox(width: 20),

          // Text and Button section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  majorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  majorDescription,
                  style: TextStyle(
                    color: Color(0xffffffff), // Adjusted for contrast
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 5, // Reduced max lines to avoid overflow
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),

                // Button aligned to bottom
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: () {
                      _showSaveDialog(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFC3F9FB),
                      side: BorderSide(color: Color(0xFF00484B), width: 1),
                    ),
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF00484B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.logout),
          iconColor: Color(0xFF00484B),
          backgroundColor: Color(0xFFC3F9FB),
          title: const Text(
            'Register',
            style: TextStyle(fontSize: 20,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
          ),
          content:  Text(
            'Are you sure to Register to ${majorName} major?',
            style: const TextStyle(fontSize: 18), // Increase font size
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 18,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 18,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
                  ),
                  onPressed: () {
                    Get.to(()=> MajorRegister(majorName: majorName, majorDescription: majorDescription));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

          ],
        );
      },
    );
  }

}
