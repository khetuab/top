import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wkumsurh/backend/controllers/user_controller.dart';
import 'package:wkumsurh/backend/controllers/auth_controller.dart';
import 'first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB05cpSxH2NW7NaMhx2wXaC_G5C5djym7Q",
      appId: "1:794071645859:web:a089a402218f28db40c916",
      authDomain: "wkumsu-b553c.firebaseapp.com",
      storageBucket: "wkumsu-b553c.firebasestorage.app",
      messagingSenderId: "794071645859",
      projectId: "wkumsu-b553c",
    ),
  );

  // Initialize AuthController after Firebase initialization
  Get.put(AuthController());
  Get.put(UserController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const FirstPage(),
    );
  }
}
