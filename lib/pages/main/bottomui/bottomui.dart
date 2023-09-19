import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qc_lowcode/pages/main/bottomui/controller/bottomcontroller.dart';
import 'package:qc_lowcode/widgets/expandedSizeWidget.dart';

import '../../floatbutton/controller/theme.dart';
import '../leftui/controller/leftUIcontroller.dart';

class BottomUIPage extends StatelessWidget {

  const BottomUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => Container(
                decoration: BoxDecoration(
              color: ReaderThemeC.current.theme.value.pannelBackgroundColor,
              border:
                  Border.all(width: 1.0, color: Colors.grey.withOpacity(0.3)),
            ))),
        Positioned(
            right: 0,
            child: IconButton(
                onPressed: () {
                  BottomUIController.current.bottomUIshow.value = !BottomUIController.current.bottomUIshow.value;
                },
                icon: const Icon(Icons.close))),


      ],
    );
  }
}
