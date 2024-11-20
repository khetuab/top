import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 pickImage(ImageSource source) async{
  final ImagePicker imagePicker = ImagePicker();
  XFile? _file = await imagePicker.pickImage(source: ImageSource.gallery);
  if(_file != null){
    return await _file.readAsBytes();
  }
  print('no image selected');
}