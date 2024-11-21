import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../backend/controllers/auth_controller.dart';
import '../../models/user_model.dart';

class MajorRegister extends StatelessWidget {
  final String majorName;
  final String majorDescription;

  MajorRegister({
    Key? key,
    required this.majorName,
    required this.majorDescription,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final authController = AuthController.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register for $majorName'),
        backgroundColor: Color(0xFDAFEBEC),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete your registration for $majorName.',
                style: TextStyle(
                  color: Color(0xFF00484B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: TextEditingController(text: authController.userName.value),
                label: 'Full Name',
                hintText: 'Enter your full name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full Name is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: TextEditingController(text: authController.userPhone.value),
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                icon: Icons.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: TextEditingController(text: authController.userEmail.value),
                label: 'Email',
                hintText: 'Enter your email',
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: TextEditingController(text: authController.userLocation.value),
                label: 'Address',
                hintText: 'Enter your address',
                icon: Icons.location_on,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: statusController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Islamic Knowledge Status',
                  hintText: 'Describe your Islamic knowledge status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Islamic Knowledge Status is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Color(0xFF00484B),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _registerMajor();
                    } else {
                      print('Form validation failed.');
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Color(0xFF00484B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }

  void _registerMajor() async {
    print('Attempting to store Major as a subcollection...');
    String? userId = authController.firebaseUser.value?.uid;

    if (userId == null) {
      Get.snackbar("Error", "User is not logged in.", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      // Fetch the user document using a query
      QuerySnapshot querySnapshot = await authController.firestore
          .collection('Users')
          .where('Id', isEqualTo: userId) // Match the UID with the 'Id' field in Firestore
          .limit(1) // Limit to one document
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('Error: User document does not exist for UID: $userId');
        Get.snackbar("Error", "User not found in the database.", snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Use the fetched document reference
      DocumentSnapshot userDocSnapshot = querySnapshot.docs.first;
      DocumentReference userDocRef = userDocSnapshot.reference;

      // Check if the Major subcollection is empty
      QuerySnapshot majorSnapshot = await userDocRef.collection('Major').get();
      if (majorSnapshot.docs.isNotEmpty) {
        print('Major information already exists.');
        Get.snackbar("Warning", "You Have Already Regitered to Majors.", snackPosition: SnackPosition.BOTTOM,colorText: Colors.red,icon: Icon(Icons.warning));
        return;
      }

      // Create a new Major object
      Major newMajor = Major(
        majorName: majorName,
        majorLevel: 'Level 1',
        date: DateTime.now().toIso8601String(),
        islamicKnowledgeStatus: statusController.text.trim(),
      );

      // Save the Major object as a new document in the 'Major' subcollection
      await userDocRef.collection('Major').doc().set(newMajor.toMap());

      print('Major stored successfully in the subcollection!');
      Get.snackbar("Success", "Major stored successfully!", snackPosition: SnackPosition.BOTTOM,icon: Icon(Icons.check_circle_outline));
    } catch (e) {
      print('Error storing Major in subcollection: $e');
      Get.snackbar("Error", "Failed to store Major: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

}