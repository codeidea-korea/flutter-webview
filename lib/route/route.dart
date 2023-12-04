import 'package:flutter_webview/pages/webview/bindings/webview_binding.dart';
import 'package:flutter_webview/pages/webview/view/webview_view_page.dart';
import 'package:get/get.dart';

import '../pages/splash/bindings/splash_binding.dart';
import '../pages/splash/view/splash_view_page.dart';

class GetXRouter {
  static final route = [
    GetPage(
        name: '/',
        page: () => const SplashViewPage(),
        binding: SplashBinding(),
        popGesture: true),
    GetPage(
        name: '/webview',
        page: () => const WebViewViewPage(),
        binding: WebViewBinding(),
        popGesture: true),
  ];
}
