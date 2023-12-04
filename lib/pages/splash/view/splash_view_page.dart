import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/global_layout_widget.dart';
import '../controller/splash_controller.dart';

class SplashViewPage extends GetView<SplashController> {
  const SplashViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
        context: context,
        body: Container(
          child: Center(
              child: Obx(() => Text("버전 : ${controller.version.value}"))),
        ));
  }
}
