import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftUIController extends GetxController{
  static LeftUIController get current => Get.find<LeftUIController>();
  RxDouble width = 300.0.obs;
  Rx<bool> leftshow = true.obs;
  RxList<bool> isSelected = [true,false,false].obs;
  late OverlayEntry  leftUIoverlayEntry;
  buttonschange(i){
    isSelected.asMap().keys.map((e) => isSelected[e]=false).toList();
    isSelected[i] = true;
    isSelected.refresh();
  }
  
}