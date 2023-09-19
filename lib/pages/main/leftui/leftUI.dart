import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qc_lowcode/pages/floatbutton/controller/theme.dart';
import 'package:qc_lowcode/pages/main/leftui/menu/menu_zujian.dart';
import 'package:qc_lowcode/widgets/button/togglebuttons.dart';
import 'package:sidebarx/sidebarx.dart';

class LeftUIpage extends StatelessWidget {

   LeftUIpage({Key? key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Obx(() => Container(
              decoration: BoxDecoration(
                color: ReaderThemeC.current.theme.value.pannelBackgroundColor,
                border:
                    Border.all(width: 1.0, color: Colors.grey.withOpacity(0.3)),
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    color:
                        ReaderThemeC.current.theme.value.pannelContainerColor,
                    width: 50,
                    height: ScreenUtil().screenHeight,
                    alignment: Alignment.topCenter,
                    child: StaticTogglebuts(
                      direction: Axis.vertical,
                      onTap: (index) {
                        pageController.jumpToPage(index);
                      },
                      children: [
                        Tooltip(
                          message: '组件',
                          child: Icon(CupertinoIcons.rectangle_grid_2x2),
                        ),
                        Tooltip(
                          message: '页面',
                          child: Icon(CupertinoIcons.rectangle_on_rectangle),
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: Container(child:
                  PageView(
                    controller: pageController,
                    children: [
                      MenuZujian(),
                      MenuZujian()
                    ],
                  ),)
                  )
                ],
              ),
            ))
      ],
    );
  }
}
