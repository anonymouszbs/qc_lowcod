import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../floatbutton/controller/theme.dart';

//组件区
class RightUIPage extends StatelessWidget {
  const RightUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Obx(() => Container(
                    decoration: BoxDecoration(
                  color: ReaderThemeC.current.theme.value.pannelBackgroundColor,
                  border: Border.all(
                      width: 1.0, color: Colors.grey.withOpacity(0.3)),
                )))
      ],
    );
  }
}
