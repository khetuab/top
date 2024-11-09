import 'package:flutter/material.dart';

import '../setting_screen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC3F9FB), Color(0xFF00484B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Profile Picture
                Center(
                  child: CircleAvatar(
                    radius: screenWidth < 600
                        ? screenWidth * 0.18
                        : screenWidth * 0.12, // Adjusts size for larger screens
                    backgroundImage: AssetImage('assets/majors/dawa.jpg'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // Edit profile picture function
                        },
                        iconSize: screenWidth * 0.07,
                        padding: const EdgeInsets.all(4.0),
                        color: const Color(0xFF00484B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // User Name and Email
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 28 : 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00484B),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 18 : 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 30),

                // Account Details Section
                Container(
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
                      _buildProfileDetailRow(Icons.phone, 'Phone', '+1 123 456 7890'),
                      _buildProfileDetailRow(Icons.location_on, 'Location', 'New York, USA'),
                      _buildProfileDetailRow(Icons.badge_outlined, 'ID Number', 'NSR/1437/14'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Settings and Logout Buttons
                Column(
                  children: [
                    _buildProfileOptionRow(Icons.settings, 'Settings', () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const SettingsScreen()));
                    }),
                    _buildProfileOptionRow(Icons.logout, 'Logout', () {
                      // Handle logout functionality
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for profile detail rows
  Widget _buildProfileDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF00484B)),
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

  // Helper method for profile option rows
  Widget _buildProfileOptionRow(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFffffff)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
