import 'package:flutter_modular/flutter_modular.dart';
import 'package:yieldup/app/modules/home/home_controller.dart';
import 'package:yieldup/app/modules/home/home_page.dart';
import 'package:yieldup/app/modules/home/services/image_picker_service.dart';
import 'package:yieldup/app/modules/home/services/image_picker_service_interface.dart';
import 'package:yieldup/app/modules/home/stores/images_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IImagePickerService>((i) => ImagePickerService()),
        Bind<ImagesStore>((i) => ImagesStore(i.get<IImagePickerService>())),
        Bind((i) => HomeController(i.get<ImagesStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => HomePage(selectedIndex: args.data,)),
      ];
}
