import 'package:flutter/cupertino.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key, required this.width, required this.height});

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF00484B), // Border color
          width: 2.0,          // Border width
        ),
        color: Color(0x55C3F9FB),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
