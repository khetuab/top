import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wkumsurh/first_page.dart';
import 'package:wkumsurh/home/home_page.dart';
import 'package:wkumsurh/login/login.dart';

import '../../models/user_model.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Observables

  late Rx<User?> firebaseUser;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userPhone = ''.obs;
  RxString userLocation = ''.obs;
  RxString userprofile = ''.obs;
  var majorList = <Major>[].obs;
  var memberList = <Member>[].obs;

  Rx<Major?> major = Rx<Major?>(null);
  Rx<Member?> member = Rx<Member?>(null);
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? user = auth.currentUser;
      if (user == null) {
        print('No user is currently signed in.');
        return null;
      }

      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Email', isEqualTo: user.email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print('User data fetched successfully: ${querySnapshot.docs[0].data()}');
        return querySnapshot.docs[0].data() as Map<String, dynamic>?;
      } else {
        print('User document does not exist.');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  void _initialScreen(User? user) {
    if (user == null) {
      print('Navigating to login page');
      Get.offAll(() => FirstPage());
    } else {
      print('Navigating to user profile page');
      loadUserData(user.email!);
      loadUserDataById(user.uid);// Load user data on login based on email
     // Get.offAll(() => UserProfilePage(email: user.email!));
      Get.offAll(()=>MyHomePage());
    }
  }

  Future<void> loadUserData(String email) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs[0];
        userName.value = userDoc['FullName'] ?? 'No Name';
        userEmail.value = userDoc['Email'] ?? '';
        userPhone.value = userDoc['PhoneNumber'] ?? '';
        userLocation.value = userDoc['Address'] ?? '';

        major.value = userDoc['Major'] != null ? Major.fromMap(userDoc['Major']) : null;
        member.value = userDoc['Member'] != null ? Member.fromMap(userDoc['Member']) : null;
      } else {
        print('User document not found for email: $email');
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  Future<void> loadUserMajor() async {
    String? userId = firebaseUser.value?.uid;
    if (userId == null) {
      print("Error: User not logged in.");
      return;
    }

    try {
      // Fetch Major subcollection
      QuerySnapshot majorSnapshots = await firestore
          .collection('Users')
          .doc(userId)
          .collection('Major')
          .get();

      // Clear existing data
      majorList.clear();

      // Populate the observable list with Major objects
      for (var doc in majorSnapshots.docs) {
        majorList.add(Major.fromMap(doc.data() as Map<String, dynamic>));
      }

      print("Major data loaded successfully.");
    } catch (e) {
      print("Error loading Major data: $e");
    }
  }

  Future<void> loadUserDataById(String userId) async {
    try {
      // Query the Users collection to find the document where the 'Id' matches the userId
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Id', isEqualTo: userId) // Match the 'Id' field
          .limit(1) // Limit to 1 result
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;

        userName.value = userData['FullName'] ?? 'No Name';
        userEmail.value = userData['Email'] ?? '';
        userPhone.value = userData['PhoneNumber'] ?? '';
        userLocation.value = userData['Address'] ?? '';
        userprofile.value = userData['ProfilePicture'] ?? '';

        member.value = userData['Member'] != null ? Member.fromMap(userData['Member']) : null;

        print("User data fetched successfully: $userData");
      } else {
        print("User document not found for UID: $userId");
      }
    } catch (e) {
      print("Error loading user data by UID: $e");
    }
  }

  Future<void> loadUserMajorById(String userId) async {
    try {
      // Query the Users collection to find the document where the 'Id' matches the userId
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Id', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;

        // Fetch the Major subcollection for the found document
        QuerySnapshot majorSnapshots =
        await userDoc.reference.collection('Major').get();

        majorList.clear(); // Clear existing data

        for (var doc in majorSnapshots.docs) {
          majorList.add(Major.fromMap(doc.data() as Map<String, dynamic>));
        }

        print("Major documents fetched: ${majorSnapshots.docs.length}");
      } else {
        print("User document not found for UID: $userId");
      }
    } catch (e) {
      print("Error loading Major data by UID: $e");
    }
  }

  Future<void> loadUserMemberById(String userId) async {
    try {
      // Query the Users collection to find the document where the 'Id' matches the userId
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Id', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;

        // Fetch the Major subcollection for the found document
        QuerySnapshot majorSnapshots =
        await userDoc.reference.collection('Member').get();

        memberList.clear(); // Clear existing data

        for (var doc in majorSnapshots.docs) {
          memberList.add(Member.fromMap(doc.data() as Map<String, dynamic>));
        }

        print("Major documents fetched: ${majorSnapshots.docs.length}");
      } else {
        print("User document not found for UID: $userId");
      }
    } catch (e) {
      print("Error loading Major data by UID: $e");
    }
  }


  Future<String?> register(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "User registered successfully.",snackPosition: SnackPosition.BOTTOM);
      return userCredential.user?.uid;
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar("Error", "Registration failed: $e",snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  void login(String email, String password) async {
    try {
      print("Login with email: $email and password: $password");
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("Login successful");
      Get.snackbar("Success", "User logged successful.",snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      print("Login failed: ${e.message}");
      Get.snackbar(
        'About Login',
        'Login message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login failed', style: TextStyle(color: Colors.white)),
        messageText: Text(e.message ?? 'Unknown error', style: const TextStyle(color: Colors.white)),
      );
    } catch (e) {
      print("Login failed with error: $e");
      Get.snackbar(
        'About Login',
        'Login message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login failed', style: TextStyle(color: Colors.white)),
        messageText: Text('Unknown error: $e', style: const TextStyle(color: Colors.white)),
      );
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
