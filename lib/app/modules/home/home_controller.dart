import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:yieldup/app/modules/home/stores/images_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

// flutter packages pub run build_runner build

abstract class _HomeController with Store {
  final ImagesStore _imagesStore;
  _HomeController(this._imagesStore);

  @observable
  bool busy = false;

  @action
  void setBusy(bool value) {
    busy = value;
  }

  Future<void> getImage() async {
    setBusy(true);
    await _imagesStore.getImage();
    setBusy(false);
  }
}
