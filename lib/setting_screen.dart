import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFF00484B),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFC3F9FB),
              Color(0xFF00484B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Information Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: screenWidth < 600
                            ? screenWidth * 0.1
                            : screenWidth * 0.06, // Adjusts size for larger screens
                        backgroundImage: AssetImage('assets/majors/dawa.jpg'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Edit profile picture function
                            },
                            iconSize: screenWidth * 0.04,
                            padding: const EdgeInsets.all(4.0),
                            color: const Color(0xFF00484B),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: "Khattab abdu",
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Color(0xFF00484B)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: "khattababdu@gmail.com",
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Color(0xFF00484B)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: "+123456789",
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Color(0xFF00484B)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Other Settings Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Other Settings",
                      style: TextStyle(
                        fontSize: screenWidth < 700 ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00484B),
                      ),
                    ),
                    SizedBox(height: 20),
                    SwitchListTile(
                      title: Text("Notifications"),
                      subtitle: Text("Receive app notifications"),
                      value: true,
                      onChanged: (bool value) {
                        // Toggle notifications setting
                      },
                    ),
                    Divider(),
                    SwitchListTile(
                      title: Text("Dark Mode"),
                      subtitle: Text("Use dark theme"),
                      value: false,
                      onChanged: (bool value) {
                        // Toggle dark mode
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.language, color: Color(0xFF00484B)),
                      title: Text("Language"),
                      subtitle: Text("Select app language"),
                      onTap: () {
                        // Navigate to language selection screen
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.privacy_tip, color: Color(0xFF00484B)),
                      title: Text("Privacy Policy"),
                      onTap: () {
                        // Show privacy policy screen
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Save profile and settings changes
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFF00484B),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
}
