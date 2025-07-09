import 'package:get/get.dart';
import 'package:ragdalion_news/home.dart';
import 'package:ragdalion_news/page/login/login_page.dart';
import 'package:ragdalion_news/services/shared_preference.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    delay();
    super.onInit();
  }

  Future<void> delay() async {
    await Future.delayed(Duration(seconds: 3));

    final StorageDevice prefs = StorageDevice();
    String? token = await prefs.getToken();

    Get.offAll(() => token == null ? LoginPage() : Home());
  }
}
