import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../global/global_layout_widget.dart';
import '../controller/webview_controller.dart';

class WebViewViewPage extends GetView<WebViewGetController> {
  const WebViewViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
        context: context,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: WebViewWidget(
            controller: controller.webViewController,
          ),
        ));
  }
}
