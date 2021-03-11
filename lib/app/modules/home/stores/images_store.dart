import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:yieldup/app/modules/home/services/image_picker_service_interface.dart';
import 'package:yieldup/app/shared/global_variables.dart';
import 'package:yieldup/app/shared/models/service_response.dart';
import 'package:yieldup/app/shared/navigation.dart';
part 'images_store.g.dart';

class ImagesStore = _ImagesStore with _$ImagesStore;

// flutter packages pub run build_runner build

abstract class _ImagesStore with Store {
  final IImagePickerService _imagePickerService;
  _ImagesStore(this._imagePickerService);

  @observable
  String error;

  @observable
  String result;

  @observable
  File selectedImage;

  @action
  void setError(String error) {
    this.error = error;
  }

  @action
  void setResult(String result) {
    this.result = result;
  }

  @action
  void setSelectedImage(File image) {
    this.selectedImage = image;
  }

  Future<void> getImage(ImageFrom imageFrom) async {
    ServiceResponse serviceResponse =
        await _imagePickerService.getImage(imageFrom);
    if (serviceResponse.success) {
      File image = serviceResponse.data as File;
      setSelectedImage(image);
      await processImage(image);
    } else {
      setError(serviceResponse.message);
    }
  }

  Future processImage(File image) async {
    await Future.delayed(Duration(seconds: 10));
    setResult("sick leaf detected");
    navigateToPageAndRemoveAllPreviousPages('/', arguments: 1);
  }
}
