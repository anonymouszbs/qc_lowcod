
import 'package:get/route_manager.dart';
import 'package:qc_lowcode/pages/main/mainwindow.dart';
import 'package:qc_lowcode/pages/splash/splash.dart';



import '../index/pages/index.dart';
import 'index_page_id.dart';

class IndexPages{
  IndexPages._();
  static final routes = {
    GetPage(name: IndexPageId.home,page: ()=> const IndexPage()),
    GetPage(name: IndexPageId.splash,page: ()=> const SplashPage()),
    GetPage(name: IndexPageId.mainwindow,page: ()=> const MainWindowPage()),
  };
}