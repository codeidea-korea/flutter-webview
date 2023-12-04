import 'package:get/get.dart';

class SplashController extends GetxController {
  RxString version = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    nextPage();
    super.onInit();
  }

  nextPage() async {
    await Duration(seconds: 1).delay();
    Get.offAllNamed('/webview');
  }
}
