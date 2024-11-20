import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../backend/controllers/auth_controller.dart';
import '../../../models/user_model.dart';

class MemberSmallCard extends StatelessWidget {
   MemberSmallCard({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.majorName,
    required this.majorDescription,
    required this.buttonText,
    required this.icon,
  });

  final double screenWidth;
  final String image;
  final String majorName;
  final String majorDescription;
  final String buttonText;
  final String icon;

  final authController = AuthController.instance;
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
        color: Color(0x99326B6E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section


          SizedBox(width: 20),

          // Text and Button section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.2,
                      height: screenWidth*0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Same radius for the image clipping
                        child: Image.asset(
                          image,
                          //fit: BoxFit.cover,        // Ensures the image covers the container
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        majorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
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
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 300,
                    child: OutlinedButton(

                      onPressed: () {
                        _beAMember();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFFC3F9FB),
                        side: BorderSide(color: Color(0xFF00484B), width: 1),
                      ),
                      child: Row(
                        children: [
                          Image(image: AssetImage(icon),width: 25,height: 25,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              buttonText,
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
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

   void _beAMember() async {
     print('Attempting to be a member...');
     String? userId = authController.firebaseUser.value?.uid;

     if (userId == null) {
       Get.snackbar('Error', 'User is not logged in', snackPosition: SnackPosition.BOTTOM);
       return;
     }

     try {
       // Fetch the user document using a query
       QuerySnapshot querySnapshot = await authController.firestore
           .collection('Users')
           .where('Id', isEqualTo: userId)
           .limit(1)
           .get();

       if (querySnapshot.docs.isEmpty) {
         print('No user data found in the database');
         Get.snackbar('Error', 'Cannot get user data in the database', snackPosition: SnackPosition.BOTTOM);
         return;
       }

       DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
       DocumentReference documentReference = documentSnapshot.reference;

       // Check if the Member subcollection is empty
       QuerySnapshot memberSnapshot = await documentReference.collection('Member').get();
       if (memberSnapshot.docs.isNotEmpty) {
         print('Member information already exists.');
         Get.snackbar("Info", "Member information already exists.", snackPosition: SnackPosition.BOTTOM);
         return;
       }

       // Create a new Member object
       Member newMember = Member(
         memberName: majorName,
         payStatus: 'true',
         regDate: DateTime.now().toIso8601String(),
       );

       // Save the Member object as a new document in the 'Member' subcollection
       await documentReference.collection('Member').doc().set(newMember.toMap());

       print('Member stored successfully in the subcollection!');
       Get.snackbar("Success", "Member stored successfully!", snackPosition: SnackPosition.BOTTOM);
     } catch (e) {
       print('Error while storing Member in subcollection: $e');
       Get.snackbar("Error", "Failed to store Member: $e", snackPosition: SnackPosition.BOTTOM);
     }
   }

}
