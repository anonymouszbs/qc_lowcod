// ignore_for_file: file_names

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qc_lowcode/pages/index/controller/indexcontroller.dart';
import 'package:qc_lowcode/pages/floatbutton/controller/theme.dart';
import 'package:qc_lowcode/pages/main/bottomui/controller/bottomcontroller.dart';
import 'package:qc_lowcode/pages/main/controller/maincontroller.dart';
import 'package:qc_lowcode/pages/main/leftui/controller/leftUIcontroller.dart';
import 'package:qc_lowcode/pages/main/rightUI/controller/RightUIcontroller.dart';

import '../config/routers.dart';

import '../pages/routers/index_page_id.dart';
import '../utils/theme_tool.dart';

class AppLication extends StatelessWidget {
  AppLication({Key? key}) : super(key: key);
  final botToast = BotToastInit();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (content, child) {
        return GestureDetector(
          //onTap: null, //全局单击
          child: GetMaterialApp(
            initialRoute: IndexPageId.splash,
            getPages: Routers.getAllRouts(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = botToast(context, child);
              
              return child;
            },
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: Themetool.getlocalprofileaboutThemeModel(),
            initialBinding: AllControllerBinding(),
          ),
        );
      },
    );
  }
}

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IndexController>(
      IndexController(),
      permanent: true,
    );
    Get.put<MainController>(
      MainController(),
      permanent: true,
    );
     Get.put<ReaderThemeC>(
      ReaderThemeC(),
      permanent: true,
    );
    Get.put<LeftUIController>(
      LeftUIController(),
      permanent: true,
    );
    Get.put<RightUIController>(
      RightUIController(),
      permanent: true,
    );
    Get.put<BottomUIController>(
      BottomUIController(),
      permanent: true,
    );
  }
}
