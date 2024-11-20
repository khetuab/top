import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';


class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user to Firestore
  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('Users').add(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Update a user's data
  Future<void> updateUser(String userId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('Users').doc(userId).update(updatedData);
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  // Fetch a user by ID
  Future<UserModel?> getUserById(String userId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('Users').doc(userId).get();
      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }

  // Delete a user by ID
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('Users').doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
