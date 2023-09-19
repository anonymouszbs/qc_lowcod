import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_lowcode/pages/floatbutton/floatbutton.dart';
import 'package:qc_lowcode/pages/routers/index_page_id.dart';
import 'package:qc_lowcode/utils/getx_untils.dart';
import 'package:window_manager/window_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {


    super.initState();
    Timer.periodic(const Duration(seconds: 3), ((timer) async {
      timer.cancel();
      await windowManager.setSize(const Size(700, 500));
      await windowManager.setMinimumSize(const Size(700, 500));
      await windowManager.center(animate: true);
      await windowManager.setOpacity(1.0);
      await windowManager.focus();
      currentTo(name: IndexPageId.home);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/applogo.ico"),
                SizedBox(
                  height: 10.h,
                ),
                const CircularProgressIndicator()
              ],
            ),
          )
        ],
      ),
    );
  }
}
