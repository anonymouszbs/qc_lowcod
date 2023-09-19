import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_bar/menu_bar.dart';
import 'package:qc_lowcode/constant/tooltips_str.dart';

import 'package:qc_lowcode/pages/floatbutton/controller/theme.dart';
import 'package:qc_lowcode/pages/main/bottomui/controller/bottomcontroller.dart';
import 'package:qc_lowcode/pages/main/demo1.dart';
import 'package:qc_lowcode/pages/main/config/normal_string_config.dart';
import 'package:qc_lowcode/pages/main/leftui/controller/leftUIcontroller.dart';

import 'package:qc_lowcode/pages/main/rightUI/controller/RightUIcontroller.dart';
import 'package:qc_lowcode/widgets/animation/translateAnimation.dart';
import 'package:window_manager/window_manager.dart';

import '../pages/main/bottomui/bottomui.dart';
import 'animation/mac_anmation.dart';

class QCAppBar extends StatefulWidget {
  final showcontroller;
  const QCAppBar({Key? key, this.showcontroller}) : super(key: key);

  @override
  State<QCAppBar> createState() => _QCAppBarState();
}

class _QCAppBarState extends State<QCAppBar> {
  bool _isfull = false;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) {
              if (Platform.isWindows) {
                windowManager.startDragging();
              }
            },
            onDoubleTap: () {
              print("dd");
            },
            child: Obx(() => AppBar(
                  shadowColor: Colors.transparent,
                  backgroundColor:
                      ReaderThemeC.current.theme.value.pannelBackgroundColor,
                  toolbarHeight: 30,
                  centerTitle: true,
                  title: Container(
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffdbe2e7)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: widget.showcontroller == false
                        ? null
                        : Wrap(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 20,
                                child: const Icon(
                                  Icons.phone_android_outlined,
                                  size: 20,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 20,
                                child: const Icon(Icons.tablet_mac_outlined,
                                    size: 20),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 20,
                                child: const Icon(Icons.desktop_mac_sharp, size: 20),
                              ),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Size(px)\n",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ReaderThemeC.current.theme.value
                                            .readerTextColor)),
                                TextSpan(
                                    text: "320*480",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ReaderThemeC.current.theme.value
                                            .readerTextColor)),
                              ]))
                            ],
                          ),
                  ),

                  ///这是左边栏控制按钮

                  actions: [
                    widget.showcontroller == false
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ToggleButtons(
                                isSelected: const [false, false, false],
                                color: Colors.white,
                                splashColor: Colors.white,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(10),
                                onPressed: (i) {
                                  switch (i) {
                                    case 0:
                                      BotToast.showWidget(
                                        toastBuilder: (cancelFunc) {
                                          return EvalFrame(
                                            canclefunc: cancelFunc,
                                          );
                                        },
                                      );
                                      break;

                                    case 1:
                                      BotToast.showWidget(
                                        toastBuilder: (cancelFunc) {
                                          return MacWindowAnimation();
                                        },
                                      );
                                      break;
                                    case 2:
                                      break;
                                    default:
                                  }
                                },
                                children: const [
                                  Tooltip(
                                    message: Tooltipstr.runbt,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  Tooltip(
                                      message: Tooltipstr.refeshbt,
                                      child: Icon(
                                        Icons.refresh_outlined,
                                        color: Colors.orangeAccent,
                                      )),
                                  Tooltip(
                                      message: Tooltipstr.stoprunbt,
                                      child: Icon(
                                        Icons.square,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                    widget.showcontroller == false
                        ? Container()
                        : Tooltip(
                            message: Tooltipstr.sideLeftbt,
                            child: MaterialButton(
                              onPressed: () {
                                LeftUIController.current.leftshow.value =
                                    !LeftUIController.current.leftshow.value;
                              },
                              minWidth: 30,
                              child: const Icon(
                                CupertinoIcons.sidebar_left,
                                size: 25,
                              ),
                            ),
                          ),
                    widget.showcontroller == false
                        ? Container()
                        : Tooltip(
                            message: Tooltipstr.siderightbt,
                            child: MaterialButton(
                              onPressed: () {
                                RightUIController.current.rightshow.value =
                                    !RightUIController.current.rightshow.value;
                              },
                              minWidth: 30,
                              child: const Icon(
                                CupertinoIcons.sidebar_right,
                                size: 25,
                              ),
                            ),
                          ),
                    widget.showcontroller == false
                        ? Container()
                        : Tooltip(
                            message: Tooltipstr.sidebottombt,
                            child: MaterialButton(
                              onPressed: () {
                                BottomUIController.current.bottomUIshow.value =
                                    !BottomUIController
                                        .current.bottomUIshow.value;
                              },
                              minWidth: 30,
                              child: const Icon(
                                CupertinoIcons.rectangle_dock,
                                size: 25,
                              ),
                            )),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: WindowCaptionButton.minimize(
                        brightness: brightness,
                        onPressed: () async {
                          bool isMinimized = await windowManager.isMinimized();
                          if (isMinimized) {
                            windowManager.restore();
                          } else {
                            windowManager.minimize();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: FutureBuilder<bool>(
                        future: windowManager.isMaximized(),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          if (snapshot.data == true) {
                            return WindowCaptionButton.unmaximize(
                              brightness: brightness,
                              onPressed: () async {
                                await windowManager.unmaximize();
                                setState(() {});
                              },
                            );
                          }
                          return WindowCaptionButton.maximize(
                            brightness: brightness,
                            onPressed: () async {
                              await windowManager.maximize();
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: WindowCaptionButton.close(
                        brightness: brightness,
                        onPressed: () {
                          windowManager.close();
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
