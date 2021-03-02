import 'package:yieldup/app/shared/models/service_response.dart';

abstract class IImagePickerService {
  Future<ServiceResponse> getImageFromCamera();
}
