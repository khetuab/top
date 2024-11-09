
import 'package:flutter/cupertino.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFC3F9FB),
          Color(0xFF00484B),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}