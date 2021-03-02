import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:yieldup/app/modules/home/services/image_picker_service_interface.dart';
import 'package:yieldup/app/shared/models/service_response.dart';
part 'images_store.g.dart';

class ImagesStore = _ImagesStore with _$ImagesStore;

// flutter packages pub run build_runner build

abstract class _ImagesStore with Store {
  final IImagePickerService _imagePickerService;
  _ImagesStore(this._imagePickerService);

  @observable
  String error;

  @observable
  File selectedImage;

  @action
  void setSelectedImage(File image) {
    this.selectedImage = image;
  }

  @action
  void setError(String error) {
    this.error = error;
  }

  Future<void> getImage() async {
    ServiceResponse serviceResponse =
        await _imagePickerService.getImageFromCamera();
    if (serviceResponse.success) {
      File image = serviceResponse.data as File;
      setSelectedImage(image);
    } else {
      setError(serviceResponse.message);
    }
  }
}
