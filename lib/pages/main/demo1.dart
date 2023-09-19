import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_lowcode/pages/floatbutton/controller/theme.dart';



class EvalFrame extends StatefulWidget {
  final canclefunc;
  const EvalFrame({super.key, this.canclefunc});

  @override
  State<EvalFrame> createState() => _EvalFrameState();
}

class _EvalFrameState extends State<EvalFrame> {
  Offset offset = const Offset(0, 30);
  Offset startpos = const Offset(0, 0);

  Size framesize = Size(320, 480);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: SizedBox(
            width: framesize.width,
            height: framesize.height,
            child: Column(
              children: [
                GestureDetector(
                    onPanStart: (details) {
                      startpos = details.localPosition;
                    },
                    onPanUpdate: (details) {
                      Offset joffset = Offset(
                          details.globalPosition.dx - startpos.dx,
                          details.globalPosition.dy - startpos.dy);

                      if (joffset.dx + framesize.width >
                              ScreenUtil().screenWidth ||
                          joffset.dy + framesize.height >
                              ScreenUtil().screenHeight ||
                          joffset.dx < 0 ||
                          joffset.dy < 30) {
                      } else {
                        offset = Offset(details.globalPosition.dx - startpos.dx,
                            details.globalPosition.dy - startpos.dy);
                        setState(() {});
                      }
                    },
                    child: AppBar(
                      shadowColor:
                          ReaderThemeC.current.theme.value.pannelContainerColor,
                      backgroundColor:
                          ReaderThemeC.current.theme.value.primaryColor,
                      toolbarHeight: 30,
                      centerTitle: true,
                      

                      actions: [
                        MaterialButton(
                          onPressed: () {
                            widget.canclefunc();
                          },
                          minWidth: 30,
                          child: Icon(
                            Icons.close,
                            color: ReaderThemeC
                                .current.theme.value.pannelBackgroundColor,
                          ),
                        )
                      ],
                    )),
                 SizedBox(
                  width: framesize.width,
            height: framesize.height-30,
                  child: const EvalWidget(
                    packages: {
                      'example': {
                        'main.dart': '''
              import 'package:flutter/material.dart';

              class MyApp extends StatelessWidget {
                const MyApp({super.key});

                // This widget is the root of your application.
                @override
                Widget build(BuildContext context) {
                  return MaterialApp(
                    title: 'flutter_eval demo1',
                    home: const MyHomePage(title: 'flutter_eval1 demo home page'),
                  );
                }
              }

              class MyHomePage extends StatefulWidget {
                const MyHomePage({Key? key, required this.title}) : super(key: key);

                final String title;

                @override
                State<MyHomePage> createState() => _MyHomePageState();
              }

              class _MyHomePageState extends State<MyHomePage> {
                _MyHomePageState();
                int _counter = 0;

                void _incrementCounter() {
                  setState(() {
                    _counter++;
                  });
                }

                @override
                Widget build(BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(widget.title),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          const Text(
                            'You have pushed the button this many times:',
                          ),
                          Text(
                            '\$_counter',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      )
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  );
                }
              }

            '''
                      }
                    },

                    /// In debug mode, flutter_eval will continually re-generate a compiled
                    /// EVC bytecode file for the given program, and save it to the specified
                    /// assetPath. During runtime, it will instead load the compiled EVC file.
                    /// To ensure this works, you must add the file path to the assets section of
                    /// your pubspec.yaml file.
                    assetPath: 'assets/program.evc',

                    /// Specify which library (i.e. which file) to use as an entrypoint.
                    library: 'package:example/main.dart',

                    /// Specify which function to call as the entrypoint.
                    /// To use a constructor, use "ClassName.constructorName" syntax. In
                    /// this case we are calling a default constructor so the constructor
                    /// name is blank.
                    function: 'MyApp.',

                    /// Specify the arguments to pass to the entrypoint. Generally these
                    /// should be dart_eval [$Value] objects, but when invoking a static or
                    /// top-level function or constructor, [int]s, [double]s, and [bool]s
                    /// should be passed directly.
                    args: [null],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
