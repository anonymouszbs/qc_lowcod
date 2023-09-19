
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:get/get.dart';
import '../../widgets/appbar.dart';
import '../floatbutton/controller/theme.dart';
import 'centersUI/body.dart';
import 'controller/maincontroller.dart';
import 'lagunage/chineseCode.dart';

class MainWindowPage extends StatefulWidget {
  const MainWindowPage({Key? key}) : super(key: key);

  @override
  State<MainWindowPage> createState() => _MainWindowPageState();
}

class _MainWindowPageState extends State<MainWindowPage> {
  final controller = CodeController(
      text: 'QC-中文编程', // Initial code
      language: chinesecode);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
     MainController.current.mainInitwidget(context);
     controller.autocompleter.setCustomWords(['你干嘛', 'word2']);
    });
    // TODO: implement initState
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    var theme = monokaiSublimeTheme;

    return Obx(() => Scaffold(
          backgroundColor:
              ReaderThemeC.current.theme.value.pannelContainerColor,
          body: Stack(
            children: [
              Column(
                children: const[
                   QCAppBar(),
                   BodyPage()
                ],
              ),
              
            ],
          ),
        ));
  }
}
