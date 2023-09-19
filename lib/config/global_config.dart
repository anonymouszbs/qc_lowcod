import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

class GlobalConfig {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance.resamplingEnabled = true;
    await initthirdparty();
  }

  static initthirdparty() async {
    //桌面尺寸初始化
    await windowManager.ensureInitialized();
    //悬浮窗通知初始化
    await localNotifier.setup(
      appName: 'QC中文编程',
      // 仅 Windows
      shortcutPolicy: ShortcutPolicy.requireCreate,
    );
    //桌面尺寸设置
    WindowOptions windowOptions = const WindowOptions(
        title: "QC中文编程",
        center: true,
        skipTaskbar: true,
        minimumSize: Size(480, 400));
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setSkipTaskbar(false);//设置跳过任务栏是否显示 true不显示 false不跳过
      await windowManager.setSize(const Size(480, 400));
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden,windowButtonVisibility: false);
      await windowManager.setOpacity(0.9);
      await windowManager.center();
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
