import 'package:flutter/material.dart';
import '../constants/sizes.dart';
import '../constants/text_strings.dart';
import '../helper/helper_functions.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image,title,subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth()*0.6, ),
              const SizedBox(height: CTsizes.spaceBtwnSections),
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

              const SizedBox(height: CTsizes.spaceBtwnItems),

              Text(subtitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: CTsizes.spaceBtwnSections),

              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed ,child:const Text(TTexts.tcontinue),),),
            ],
          ),
        ),
      ),
    );
  }
}
