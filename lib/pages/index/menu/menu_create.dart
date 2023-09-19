import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import '../../../utils/getx_untils.dart';
import '../../../widgets/SliverGridDelegateWithFixedSize.dart';
import '../../floatbutton/controller/theme.dart';
import '../../routers/index_page_id.dart';

class MenuCreate extends StatefulWidget {
  const MenuCreate({Key? key}) : super(key: key);

  @override
  State<MenuCreate> createState() => _MenuCreateState();
}

class _MenuCreateState extends State<MenuCreate> {
  int _currentIndex = 0;
  String savePath = "";
  createProject()async{
    await windowManager.setSize(const Size(1920, 1080));
    await windowManager.setMinimumSize(const Size(1920, 1080));
    await windowManager.center(animate: true);
    await windowManager.setOpacity(1.0);
    await windowManager.focus();
    currentTo(name: IndexPageId.mainwindow);
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "新建QC-App项目",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: ReaderThemeC.current.theme.value.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "基于flutter框架，一次开发，同时支持编译android，ios，另支持windows和web",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: ReaderThemeC.current.theme.value.primaryColor),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ReaderThemeC.current.theme.value.primaryColor,
                        width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ReaderThemeC.current.theme.value.dividerColor,
                        width: 2),
                  ),
                  hintText: "项目名称",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ),
              TextField(
                controller: TextEditingController(text: savePath),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ReaderThemeC.current.theme.value.primaryColor,
                        width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ReaderThemeC.current.theme.value.dividerColor,
                        width: 2),
                  ),
                  hintText: "位置",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  suffixIcon: TextButton(
                      onPressed: () async {
                        String? selectedDirectory =
                            await FilePicker.platform.getDirectoryPath();

                        if (selectedDirectory != null) {
                          setState(() {
                            savePath = selectedDirectory;
                          });
                        }
                      },
                      child: Text(
                        "浏览",
                        style: TextStyle(
                            color: ReaderThemeC
                                .current.theme.value.pannelTextColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                color: Colors.transparent,
                height: 255,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "选择模板",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 225,
                      child: GridView.builder(
                        controller: ScrollController(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedSize(
                          150,
                          225,
                          mainAxisSpacing: 2.0,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  _currentIndex = index;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: _currentIndex == index
                                          ? ReaderThemeC
                                              .current.theme.value.primaryColor
                                          : const Color.fromRGBO(
                                              197, 187, 148, 1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset(
                                        "assets/img/gujiatu.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                      _currentIndex == index
                                          ? Positioned(
                                              bottom: 10,
                                              child: Icon(
                                                Icons.check_circle_outline,
                                                size: 35,
                                                color: ReaderThemeC.current
                                                    .theme.value.primaryColor,
                                              ))
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "默认模板",
                                style: TextStyle(
                                    color: ReaderThemeC
                                        .current.theme.value.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "默认模板",
                                style: TextStyle(
                                    color: ReaderThemeC
                                        .current.theme.value.pannelTextColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: ReaderThemeC.current.theme.value.primaryColor,
                        shadowColor:
                            ReaderThemeC.current.theme.value.primaryColor),
                    onPressed: createProject,
                    child: Text(
                      "创建（N）",
                      style: TextStyle(
                          color:
                              ReaderThemeC.current.theme.value.pannelTextColor),
                    )),
              )
            ],
          ),
        ));
  }
}
