import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';

class SystemUtils {
  ///系统悬浮窗(标题，内容，单机回调)
  static notific(
      {title,
      body,
      required Function() onclick,
      required Function() onshow,
      required Function() onclose}) {
    LocalNotification notification = LocalNotification(
      title: title,
      body: body,
    );
    notification.onShow = () {
      onshow();
    };
    notification.onClose = (closeReason) {
      // Only supported on windows, other platforms closeReason is always unknown.
      switch (closeReason) {
        case LocalNotificationCloseReason.userCanceled:
          // do something
          break;
        case LocalNotificationCloseReason.timedOut:
          // do something
          break;
        default:
      }
    };
    notification.onClick = () {
      onclick();
    };
    notification.onClickAction = (actionIndex) {
      onclose();
    };

    notification.show();
  }

  static showQCnotific({title,icon}){
    BotToast.showNotification(leading: (cancel) => SizedBox.fromSize(
                          size: const Size(40, 40),
                          child: IconButton(
                            icon: Icon(icon, color: Colors.redAccent),
                            onPressed: cancel,
                          )),
                      title: (_) =>  Text(title),
                      //subtitle: (_) => const Text("编译完成"),
                      trailing: (cancel) => IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: cancel,
                          ),
                       
                      );
  }
}
