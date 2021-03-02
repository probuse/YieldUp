import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yieldup/app/modules/home/services/image_picker_service_interface.dart';
import 'package:yieldup/app/shared/models/service_response.dart';

class ImagePickerService implements IImagePickerService {
  final imagePicker = ImagePicker();
  Future<ServiceResponse> getImageFromCamera() async {
    try {
      final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        return ServiceResponse(success: true, data: file);
      } else {
        return ServiceResponse(success: false, message: "No image selected");
      }
    } catch (e) {
      if (e is PlatformException) {
        return ServiceResponse(success: false, message: e.message);
      }
      return ServiceResponse(success: false, message: e.toString());
    }
  }
}
