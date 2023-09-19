

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qc_lowcode/pages/index/menu/menu_create.dart';
import 'package:qc_lowcode/pages/index/menu/menu_history.dart';
import 'package:qc_lowcode/pages/index/menu/menu_sdk.dart';
import 'package:qc_lowcode/pages/index/menu/menu_settings.dart';
import '../../../widgets/appbar.dart';
import '../../floatbutton/controller/theme.dart';
import '../../floatbutton/floatbutton.dart';



class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _items = [
    {"创建项目": Icons.add_business_rounded},
    {"历史项目": Icons.history},
    {"环境配置": Icons.store},
    {"程序设置": Icons.settings}
  ];
  int _currentindex = 0;
  String _title = "";
  var floatUIoverlayEntry;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
       floatUIoverlayEntry = OverlayEntry(
          maintainState: true,
          builder: (context) {
            return  FloatButton();
          });
      Overlay.of(context).insert(
        floatUIoverlayEntry,
      );
    });
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    floatUIoverlayEntry.remove();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(() =>Scaffold(
      backgroundColor: ReaderThemeC.current.theme.value.pannelContainerColor,
      body: Stack(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          String str = "";
                          IconData icon = Icons.add;
                          for (var element in _items[index].entries) {
                            str = element.key;
                            icon = element.value;
                          }
                          return InkWell(
                            onTap: () {
                              _currentindex = index;
                              _title = str;
                              setState(() {});
                            },
                            child: Container(
                              color: _currentindex == index
                                  ? ReaderThemeC.current.theme.value.primaryColor
                                  : Colors.transparent,
                              height: 40.h,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    icon,
                                    color: _currentindex == index
                                        ? Colors.white
                                        : ReaderThemeC.current.theme.value.primaryColor,
                                  ),
                                  Text(
                                    str,
                                    style:  TextStyle(color: _currentindex == index
                                        ? Colors.white
                                        : ReaderThemeC.current.theme.value.pannelTextColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(color: Colors.grey[200]),
                          );
                        },
                        itemCount: _items.length),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                 const QCAppBar(showcontroller: false,),
                  IndexedStack(
                    index: _currentindex,
                    children: const [
                      MenuCreate(),
                      MenuHistory(),
                      MenuAsdk(),
                      MenuSettings()
                    ],
                  ),
                ],
              )),
            ],
          ),
         
        ],
      ),
    ));
  }
}
