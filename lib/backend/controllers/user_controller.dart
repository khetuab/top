import 'package:get/get.dart';
import '../../models/user_model.dart';
import 'user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  static UserController get instance => Get.find();
  // Reactive user data
  var user = Rx<UserModel?>(null);

  // Fetch user by ID and update the reactive variable
  Future<void> fetchUserById(String userId) async {
    try {
      UserModel? fetchedUser = await _userService.getUserById(userId);
      user.value = fetchedUser;  // This will update any UI using user data
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  // Add a new user
  Future<void> addUser(UserModel newUser) async {
    try {
      await _userService.addUser(newUser);
      fetchUserById(newUser.id!);  // Refresh after adding
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Update user information
  Future<void> updateUser(String userId, Map<String, dynamic> updatedData) async {
    try {
      await _userService.updateUser(userId, updatedData);
      fetchUserById(userId);  // Refresh after updating
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  // Delete user by ID
  Future<void> deleteUser(String userId) async {
    try {
      await _userService.deleteUser(userId);
      user.value = null;  // Clear user data from state
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
