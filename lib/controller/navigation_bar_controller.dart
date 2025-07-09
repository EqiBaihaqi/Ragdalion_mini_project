import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }
}
