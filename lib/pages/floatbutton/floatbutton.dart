import 'package:bot_toast/bot_toast.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../index/controller/indexcontroller.dart';
import 'controller/theme.dart';
import 'menu_theme.dart';

class FloatButton extends StatelessWidget {
  FloatButton({Key? key}) : super(key: key);

  final  circularMenu1 = CircularMenu(
      alignment:Alignment.bottomCenter ,
      radius: 100,
      animationDuration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      // animation curve in reverse
      reverseCurve: Curves.fastOutSlowIn,
      // first item angle
      startingAngleInRadian : 0 ,
      // last item angle
      toggleButtonColor: Colors.pink,
      endingAngleInRadian : 0,
      toggleButtonBoxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 10,
        ),
      ],
      toggleButtonIconColor: Colors.white,
      toggleButtonMargin: 10.0,
      toggleButtonPadding: 10.0,
      toggleButtonSize: 40.0,
      items: [
    CircularMenuItem(icon: Icons.home, onTap: () {
      // callback
    }),
    CircularMenuItem(icon: Icons.search, onTap: () {
      //callback
    }),
    CircularMenuItem(icon: Icons.settings, onTap: () {
      //callback
    }),
    CircularMenuItem(icon: Icons.star, onTap: () {
      //callback
    }),
    CircularMenuItem(icon: Icons.pages, onTap: () {
      //callback
    }),
  ]);
  final  circularMenu2 = SpeedDial(
    backgroundColor:
    ReaderThemeC.current.theme.value.primaryColor,
    overlayColor: Colors.black,
    overlayOpacity: 0.2,
    icon: Icons.rocket,
    elevation: 4.0,
    buttonSize: const Size(44, 44),
    childrenButtonSize: const Size(56, 56),
    //animationAngle: -pi / 4, // 图标的旋转角度，和图标本身的朝向没关系
    activeIcon: Icons.rocket_launch,
    direction: ReaderThemeC.current.floatbuttonDirection.value,
    spaceBetweenChildren: 4.0,
    spacing: 4.0,
    children: [
      SpeedDialChild(
        child: const Icon(Icons.color_lens_outlined),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onTap: () {
          BotToast.showEnhancedWidget(
              clickClose: true,
              toastBuilder: ((cancelFunc) {
                return MenuThemes(
                  onChangeTheme: ((theme) {
                    ReaderThemeC.current.theme.value = theme;
                    ReaderThemeC.current.theme.refresh();
                  }),
                  onClose: () {
                    cancelFunc();
                  },
                );
              }));
        },
      ),
      SpeedDialChild(
        child: const Icon(Icons.settings),
        backgroundColor: Colors.orange[300],
        foregroundColor: Colors.white,
        onTap: () {},
      ),
      SpeedDialChild(
        child: const Icon(Icons.person),
        backgroundColor: Colors.purple[300],
        foregroundColor: Colors.white,
        onTap: () {},
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    Offset startPostion = const Offset(0, 0);
    return  Obx(() =>
            Positioned(
                left: IndexController.current.floatbOffset.value.dx ,
                top: IndexController.current.floatbOffset.value.dy,
                child: GestureDetector(
                  onTapDown: (details) {
                    IndexController.current.floatbEexpaned.value =
                        !IndexController.current.floatbEexpaned.value;
                  },
                  onPanDown: (details){
                    startPostion = Offset(0, 0);
                  },
                  onPanStart: (details) {
                    startPostion = details.localPosition;
                  },
                  onPanUpdate: (details) {
                    Offset globalp = Offset(
                        details.globalPosition.dx, details.globalPosition.dy);
                    if (globalp.dx-
                    startPostion.dx > 0 &&
                        globalp.dy-
                    startPostion.dy > 0 &&
                        (globalp.dx-startPostion.dx)+44 < (ScreenUtil().screenWidth )&&
                        (globalp.dy-startPostion.dy)+40 < ScreenUtil().screenHeight) {
                      IndexController.current.floatbOffset.value = Offset(globalp.dx - startPostion.dx, globalp.dy - startPostion.dy);
                    }
                    if (globalp.dx + (56 * 4) > ScreenUtil().screenWidth) {
                      ReaderThemeC.current.floatbuttonDirection.value =
                          SpeedDialDirection.left;
                    } else if (globalp.dx - 44 < 0) {
                      ReaderThemeC.current.floatbuttonDirection.value =
                          SpeedDialDirection.right;
                    } else if (globalp.dy -44 <0) {
                      ReaderThemeC.current.floatbuttonDirection.value =
                          SpeedDialDirection.down;
                    } else if (globalp.dy + 44 >
                        ScreenUtil().screenHeight) {
                          ReaderThemeC.current.floatbuttonDirection.value =
                          SpeedDialDirection.up;
                    }else{
                        ReaderThemeC.current.floatbuttonDirection.value =
                          SpeedDialDirection.right;
                    }
                  },
                  child:circularMenu2,

                ))
         );
  }
}
