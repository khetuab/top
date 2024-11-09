
import 'package:flutter/cupertino.dart';

class HLogo extends StatelessWidget {
  const HLogo({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        child: Image.asset('assets/logo/wkumosque.png',
          opacity: const AlwaysStoppedAnimation<double>(0.5),
          width: screenWidth * 0.5,
          height: screenHeight * 0.75,
          fit: BoxFit.cover,
        )
    );
  }
}
