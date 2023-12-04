import 'package:get/get.dart';

import '../controller/webview_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(MyPageController());
    // Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => WebViewGetController());
  }
}

