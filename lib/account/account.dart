import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wkumsurh/backend/controllers/auth_controller.dart';
import '../setting/setting_screen.dart';

class UserProfilePage extends StatelessWidget {
  final String email;

  UserProfilePage({Key? key, required this.email}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: AuthController.instance.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Failed to load user data'));
          } else {
            final userData = snapshot.data!;
            return _buildProfilePageContent(context, screenWidth, userData);
          }
        },
      ),
    );
  }

  Widget _buildProfilePageContent(BuildContext context, double screenWidth, Map<String, dynamic> userData) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC3F9FB), Color(0xFF00484B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),
              _buildProfileAvatar(screenWidth),
              const SizedBox(height: 50),
              _buildUserNameAndEmail(userData['FullName'] ?? 'User Name', userData['Email'] ?? email, screenWidth),
              const SizedBox(height: 30),
              _buildAccountDetails(userData),
              const SizedBox(height: 250),
              _buildSettingsAndLogout(context),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.logout),
          iconColor: Color(0xFF00484B),
          backgroundColor: Color(0xFFC3F9FB),
          title: const Text(
            'Log out',
            style: TextStyle(fontSize: 20,color: Color(0xFF00484B),fontWeight: FontWeight.bold), // Increase font size
          ),
          content: const Text(
            'Are you sure to log out?',
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
                    'Log out',
                    style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold), // Increase font size
                  ),
                  onPressed: () {
                    AuthController.instance.logout();
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

  // Profile picture widget
  Widget _buildProfileAvatar(double screenWidth) {
    return Stack(
      children: [
        Positioned(child: IconButton(onPressed: Get.back,icon: Icon(Icons.arrow_back),)),
        Center(
          child: CircleAvatar(
            radius: screenWidth < 600 ? screenWidth * 0.18 : screenWidth * 0.12,
            backgroundImage: AssetImage('assets/supportLevel/profile.jpg'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Add function to edit profile picture
                },
                iconSize: screenWidth * 0.07,
                padding: const EdgeInsets.all(4.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  // User name and email
  Widget _buildUserNameAndEmail(String name, String email, double screenWidth) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: screenWidth > 600 ? 28 : 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF00484B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(
              fontSize: screenWidth > 600 ? 18 : 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  // Account details
  Widget _buildAccountDetails(Map<String, dynamic> userData) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildProfileDetailRow(Icons.phone, 'Phone', userData['PhoneNumber'] ?? 'Not provided'),
          _buildProfileDetailRow(Icons.location_on, 'Location', userData['Address'] ?? 'Not provided'),
        ],
      ),
    );
  }

  // Settings and logout
  Widget _buildSettingsAndLogout(BuildContext context) {
    return Column(
      children: [
        _buildProfileOptionRow(Icons.settings, 'Settings', () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        }),
        _buildProfileOptionRow(Icons.logout, 'Logout', () {
          _showLogoutDialog(context);
        }),
      ],
    );
  }

  Widget _buildProfileDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00484B)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptionRow(IconData icon, String title, VoidCallback onTap) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFFFFFF)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

