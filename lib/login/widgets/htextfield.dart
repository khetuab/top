
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HTextField extends StatelessWidget {
  const HTextField({
    super.key,
    required this.name,
    required this.icon,
    required this.description,
  });

  final String name;
  final String description;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(icon, color: Color(0xFF00484B)), // Icon color
          labelText: name,
          labelStyle: TextStyle(color: Color(0xFF00484B)), // Label color
          hintText: description,
          hintStyle: TextStyle(color: Color(0x55C3F9fB)), // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: BorderSide(
              color: Color(0x55C3F9fB), // Color of the border
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0x55C3F9fB), // Border color when enabled
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xFF00484B), // Border color when focused
              width: 2.0,
            ),
          ),
          filled: true, // Fill the background
          fillColor: Color(0x66C3F9fB), // Background color of the field
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Padding inside the field
        ),

        style: TextStyle(fontSize: 16), // Text style inside the field
      ),
    );
  }
}
