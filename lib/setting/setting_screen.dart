import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../backend/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ImagePicker _picker = ImagePicker();
  final AuthController authController = Get.find<AuthController>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  File? _profileImage;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    _loadUserProfile();
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    String? userId = authController.firebaseUser.value?.uid;
    if (userId != null) {
      await authController.loadUserDataById(userId);
      await authController.loadUserMajorById(userId);
      await authController.loadUserMemberById(userId);

      // Set initial values for text controllers
      setState(() {
        nameController.text = authController.userName.value;
        emailController.text = authController.userEmail.value;
        phoneController.text = authController.userPhone.value;
        addressController.text = authController.userLocation.value;
      });
    }
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
            'Save',
            style: TextStyle(fontSize: 20,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
          ),
          content: const Text(
            'Are you sure to Save?',
            style: TextStyle(fontSize: 18), // Increase font size
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
                  ),
                  onPressed: () {
                    _saveProfile();
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

  Future<void> _saveProfile() async {
    String? userId = authController.firebaseUser.value?.uid;
    if (userId == null) {
      Get.snackbar("Error", "User is not logged in.", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Id', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update({
          'FullName': authController.userName.value.trim(),
          'Email': authController.userEmail.value.trim(),
          'PhoneNumber': authController.userPhone.value.trim(),
          'Address': authController.userLocation.value.trim(),
        });
        authController.userName.value = nameController.text.trim();
        authController.userEmail.value = emailController.text.trim();
        authController.userPhone.value = phoneController.text.trim();
        authController.userLocation.value = addressController.text.trim();
        Get.snackbar("Success", "Profile updated successfully.", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error saving profile: $e");
      Get.snackbar("Error", "Failed to save profile: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFFBEEAEA),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableFields(screenWidth),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){_showSaveDialog(context);},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Color(0xFF00484B),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableFields(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFC3F9FB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: (){},
              child: CircleAvatar(
                radius: screenWidth * 0.1,
                backgroundImage: AssetImage('assets/supportLevel/profile.jpg')
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Full Name'),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          SizedBox(height: 20),
          _buildMemberSection(),
          SizedBox(height: 20),
          _buildMajorSection(),
        ],
      ),
    );
  }

  Widget _buildMemberSection() {
    return Obx(() {
      if (authController.memberList.isEmpty) {
        return Center(
          child: Text("No Member information available.", style: TextStyle(color: Colors.red, fontSize: 16)),
        );
      }

      return Column(
        children: authController.memberList.map((member) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text("Member information"),
              subtitle: Text(
                  "Member Name: ${member.memberName}\nPayment Status: true\nDate: ${member.regDate}"),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget _buildMajorSection() {
    return Obx(() {
      if (authController.majorList.isEmpty) {
        return Center(
          child: Text("No Major information available.", style: TextStyle(color: Colors.red, fontSize: 16)),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: authController.majorList.map((major) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text("Major Name: ${major.majorName}"),
              subtitle: Text(
                  "Level: ${major.majorLevel}\nStatus: ${major.islamicKnowledgeStatus}\nDate: ${major.date}"),
            ),
          );
        }).toList(),
      );
    });
  }
}
