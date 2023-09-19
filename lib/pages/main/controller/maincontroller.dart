import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qc_lowcode/pages/main/bottomui/bottomui.dart';
import 'package:qc_lowcode/pages/main/bottomui/controller/bottomcontroller.dart';
import 'package:qc_lowcode/widgets/expandedSizeWidget.dart';

import '../../../widgets/animation/translateAnimation.dart';
import '../../floatbutton/floatbutton.dart';
import '../config/normal_string_config.dart';
import '../leftui/controller/leftUIcontroller.dart';
import '../leftui/leftUI.dart';
import '../rightUI/controller/RightUIcontroller.dart';
import '../rightUI/rightUI.dart';

class MainController extends GetxController {
  static MainController get current => Get.find<MainController>();

  mainInitwidget(context) {
    LeftUIController.current.leftUIoverlayEntry = OverlayEntry(
      builder: (context) {
        double startsize = 0.0;
        return Container(
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.centerLeft,
          child: Obx(
            () => SizedBox(
                width: LeftUIController.current.width.value,
                child: TranslateAnimation(
                    direction: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 0),
                    alignment: Alignment.centerLeft,
                    isshow: LeftUIController.current.leftshow.value,
                    frame: ExpandedSizeWidget(
                      frame1:  LeftUIpage(),
                      onpanstart: () {
                        startsize = LeftUIController.current.width.value;
                      },
                      changeSize: (ExpandSizeDirection expandSizeDirection,
                          double size) {
                        if (expandSizeDirection == ExpandSizeDirection.RIGHT) {
                          LeftUIController.current.width.value =
                              (startsize + size) > 10 ? (startsize + size) : 10;
                          BottomUIController.current.leftpadding.value =
                              LeftUIController.current.width.value;
                        }
                      },
                    ))),
          ),
        );
      },
    );
    BottomUIController.current.bottomUIoverlayEntry = OverlayEntry(
      builder: (context) {
        double startsize = 0.0;

        return Container(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Container(
                padding: EdgeInsets.only(
                    left: BottomUIController.current.leftpadding.value,
                    right: BottomUIController.current.rightpadding.value),
                height: BottomUIController.current.height.value,
                child: TranslateAnimation(
                  direction: Axis.vertical,
                  isshow: BottomUIController.current.bottomUIshow.value,
                  frame: ExpandedSizeWidget(
                      frame1: const BottomUIPage(),
                      onpanstart: () {
                        startsize = BottomUIController.current.height.value;
                      },
                      changeSize: (ExpandSizeDirection type, double offset) {
                        if (type == ExpandSizeDirection.TOP) {
                          BottomUIController.current.height.value =
                              (startsize + -offset) > 10
                                  ? (startsize + -offset)
                                  : 10;
                        }
                      }),
                  padding: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ));
      },
    );

    RightUIController.current.rightUIoverlayEntry =
        OverlayEntry(builder: (context) {
      double startsize = 0;

      return Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(top: 30),
          child: Obx(
            () => SizedBox(
                width: RightUIController.current.width.value,
                child: TranslateAnimation(
                  direction: Axis.horizontal,
                  isshow: RightUIController.current.rightshow.value,
                  frame: ExpandedSizeWidget(
                    frame1: const RightUIPage(),
                    onpanstart: () {
                      startsize = RightUIController.current.width.value;
                    },
                    changeSize: (ExpandSizeDirection type, double offset) {
                      if (type == ExpandSizeDirection.LEFT) {
                        RightUIController.current.width.value =
                            (startsize + -offset) > 10
                                ? (startsize + -offset)
                                : 10;
                        BottomUIController.current.rightpadding.value =
                            RightUIController.current.width.value;
                      }
                    },
                  ),
                  padding: const EdgeInsets.only(top: 0),
                  alignment: Alignment.centerRight,
                )),
          ));
    });

      var floatUIoverlayEntry = OverlayEntry(
          maintainState: true,
          builder: (context) {
            return FloatButton();
          });


    Overlay.of(context).insertAll([
      RightUIController.current.rightUIoverlayEntry,
      BottomUIController.current.bottomUIoverlayEntry,
      LeftUIController.current.leftUIoverlayEntry,
      floatUIoverlayEntry
    ]);
  }
}
