
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../support/member/member.dart';
import '../register/major_register.dart';

class HMajorCard extends StatelessWidget {
  const HMajorCard({
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
      width: screenWidth * 0.7,
      height: 320,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF00484B), // Border color
            width: 2.0,          // Border width
          ),
          color: Color(0x55C3F9FB),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  child: Image(image: AssetImage(image,),width: 100,height: 100,),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                Text(majorName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
              ],
            ),

          ),
          Expanded(
            child: Text(
              majorDescription,
              style: TextStyle(
                  color: Color(0xffC3F9FB),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins'),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          OutlinedButton(

            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFFC3F9FB),
              side: BorderSide(color: Color(0xFF00484B), width: 1),
            ),
            onPressed: () {
              _showSaveDialog(context);
              },
            child: Text(
              'Register now',
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
                    Navigator.of(context).pop();
                    Get.off(()=> MajorRegister(majorName: majorName, majorDescription: majorDescription));
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
