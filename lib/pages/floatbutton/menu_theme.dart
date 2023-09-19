import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../widgets/animation/animation.dart';
import 'controller/theme.dart';


class MenuThemes extends StatelessWidget {
  final void Function(ReaderTheme theme) onChangeTheme;
  final void Function() onClose;
  const MenuThemes({super.key, required this.onChangeTheme, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AnimationsPY(
        padding: const EdgeInsets.only(bottom: 0),
        frame: Obx(
          () => Container(
            color: ReaderThemeC.current.theme.value.pannelBackgroundColor,
            width: MediaQuery.of(context).size.width,
            height: (ScreenUtil().screenHeight)*0.4,
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                      child: Text(
                        "主题",
                        style:
                            TextStyle(fontSize: 16, color:  ReaderThemeC.current.theme.value.pannelTextColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(onPressed: (){
                      onClose();
                    },minWidth: 35,child: const Icon(Icons.close,size: 35,),)
                   ],),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SingleChildScrollView(
                        
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: readerThemeList.map((theme) {
                            return GestureDetector(
                              onTap: () {
                               // widget.onThemeItemTap(theme);
                               onChangeTheme(theme);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 0.7, color: theme.dividerColor),
                                    color: theme.pannelContainerColor),
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 18),
                                        child: ClipOval(
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color:  ReaderThemeC.current.theme.value.pannelBackgroundColor),
                                                  borderRadius: BorderRadius.circular(50),
                                                  color:  ReaderThemeC.current.theme.value.key == theme.key
                                                      ? theme.primaryColor
                                                      : theme.pannelContainerColor)),
                                        ),
                                      ),
                                      Text(
                                        theme.name.split("").join("\n"),
                                        style: TextStyle(color: theme.pannelTextColor,fontSize: 18),
                                      )
                                    ]),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )

          )),tab: ReaduiType.BOTTOM,);
  }
}