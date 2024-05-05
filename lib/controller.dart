import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt increment = 100.obs;

  Ontap() {
    increment++;
  }
}
