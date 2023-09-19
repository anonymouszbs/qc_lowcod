import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qc_lowcode/config/global_config.dart';

import 'init/application.dart';

void main(List<String> args) {
runZonedGuarded(
    () => init(),
    // ignore: avoid_print
    (err, stace) => print(FlutterErrorDetails(exception: err, stack: stace)),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        if (line.length > 800) {
          parent.print(zone, '字符串长度为 ${line.length}');
        } else {
          parent.print(zone, line);
        }
      },
    ),
  );
}

init() async{
    await GlobalConfig.init();
    runApp( AppLication());
}
