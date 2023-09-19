import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomUIController extends GetxController {
  static BottomUIController get current => Get.find<BottomUIController>();
  late OverlayEntry bottomUIoverlayEntry;
  RxDouble height = 300.0.obs;
  RxDouble rightpadding = 300.0.obs;
  RxDouble leftpadding = 300.0.obs;
  Rx<bool> bottomUIshow = true.obs;
}
