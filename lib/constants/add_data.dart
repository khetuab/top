// import 'package:firebase_storage/firebase_storage.dart';
//
// final  FirebaseStorage _storage = FirebaseStorage.instance;
// class StoreData{
//
//   Future<String> uploadImageToStorage() async{
//
//   }
// }

import 'dart:io';
import 'package:dio/dio.dart';

class CloudinaryService {
  final String cloudName = "dnlmhp7lk"; // Replace with your Cloudinary cloud name
  final String apiKey = "892836276552655"; // Replace with your Cloudinary API key
  final String apiSecret = "Qitd5z7AKnscFvBKEw6vMCO1Xuo"; // Replace with your Cloudinary API secret

  Future<String?> uploadImage(File file) async {
    try {
      String uploadUrl = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
        "upload_preset": "reyuhabib", // Set up a preset in Cloudinary and use its name here
      });

      Response response = await Dio().post(uploadUrl, data: formData);
      if (response.statusCode == 200) {
        return response.data["secure_url"]; // URL of the uploaded image
      } else {
        print("Cloudinary Upload Error: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
      return null;
    }
  }
}
