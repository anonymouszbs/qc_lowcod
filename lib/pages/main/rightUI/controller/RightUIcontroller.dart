import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightUIController extends GetxController{
  static RightUIController get current => Get.find<RightUIController>();
  RxDouble  width = 300.0.obs;
  Rx<bool> rightshow = true.obs;
  late OverlayEntry  rightUIoverlayEntry;
  
}