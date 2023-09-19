




import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ExpandSizeDirection{
  TOP,LEFT,RIGHT,BOTTOM
}
class ExpandedSizeWidget extends StatefulWidget {
  final Function() onpanstart;
  final Widget frame1;
  final Function(ExpandSizeDirection type,double offset)  changeSize;
  const ExpandedSizeWidget({Key? key, required this.frame1, required this.changeSize, required this.onpanstart}) : super(key: key);

  @override
  State<ExpandedSizeWidget> createState() => _ExpandedSizeWidgetState();
}

class _ExpandedSizeWidgetState extends State<ExpandedSizeWidget> {


  //
  //记录开始变量
  Offset startOffset =  const Offset(0,0);
  SystemMouseCursor systemMouseCursors = SystemMouseCursors.resizeColumn;
  Widget surround(ExpandSizeDirection epd){
    double width = 0.0;
    double height = 0.0;
    switch (epd) {
      case ExpandSizeDirection.TOP:
        systemMouseCursors = SystemMouseCursors.resizeUp;
        width = MediaQuery.of(context).size.width;
        height = 5;
        break;
      case ExpandSizeDirection.LEFT:
        systemMouseCursors = SystemMouseCursors.resizeLeft;
        width = 5;
        height = MediaQuery.of(context).size.height;
        break;
      case ExpandSizeDirection.RIGHT:
        systemMouseCursors = SystemMouseCursors.resizeRight;
        width = 5;
        height = MediaQuery.of(context).size.height;
        break;
      case ExpandSizeDirection.BOTTOM:
        systemMouseCursors = SystemMouseCursors.resizeDown;
        width = MediaQuery.of(context).size.width;
        height = 5;
        break;
      default:
        break;

    }
  return GestureDetector(
    onPanStart:(detail) {
      widget.onpanstart();
      startOffset = detail.localPosition;
    },
    onPanUpdate: (detail){


        switch (epd) {
          case ExpandSizeDirection.TOP:

            widget.changeSize(epd,(detail.localPosition.dy-startOffset.dy));
            break;
          case ExpandSizeDirection.LEFT:
            widget.changeSize(epd,(detail.localPosition.dx-startOffset.dx));
            break;
          case ExpandSizeDirection.RIGHT:
            widget.changeSize(epd,(detail.localPosition.dx-startOffset.dx));
            break;
          case ExpandSizeDirection.BOTTOM:
            widget.changeSize(epd,(detail.localPosition.dy-startOffset.dy));
            break;
        }


    },
    child: MouseRegion(
      cursor: systemMouseCursors,
      child: Container(
        height: height,
        width: width,

      ),
    ),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.frame1,

        Positioned(
            top: 0,
            child:surround(ExpandSizeDirection.TOP)),
        Positioned(
            left: 0,
            child: surround(ExpandSizeDirection.LEFT)),
        Positioned(
            right: 0,
            child: surround(ExpandSizeDirection.RIGHT)),
        Positioned(
            bottom: 0,
            child: surround(ExpandSizeDirection.BOTTOM))
      ],
    );
  }
}
