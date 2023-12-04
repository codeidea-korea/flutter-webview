import 'dart:ui';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewGetController extends GetxController {
  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))

    ///웹뷰에서 웹과 통신을 하기위한 채널
    // ..addJavaScriptChannel('', onMessageReceived: (massege){

    // })
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          ///해당 주소로 진행시 웹사이트 진행을 막습니다.
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }

          ///그 이외일경우 웹사이트 진행 계속합니다.
          return NavigationDecision.navigate;
        },
      ),
    )

    ///해당 주소 변경시 변경됩니다.
    ..loadRequest(Uri.parse('https://codeidea.dev/'));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
