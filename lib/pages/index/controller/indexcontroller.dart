




import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexController extends GetxController{
  static IndexController get current => Get.find<IndexController>();
  Rx<Offset> floatbOffset = const Offset(80, 300).obs;
  RxBool floatbIsShow= true.obs,floatbEexpaned = true.obs;
  
}