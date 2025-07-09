import 'package:get/get.dart';
import 'package:ragdalion_news/page/login/login_page.dart';
import 'package:ragdalion_news/services/shared_preference.dart';

class ProfileController extends GetxController {
  void logout() async {
    try {
      await StorageDevice().clearToken();
      Get.offAll(() => LoginPage());
    } catch (e) {
      Get.snackbar('Gagal', 'Logout gagal');
    }
  }
}
