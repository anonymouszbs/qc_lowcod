import 'package:get/get.dart';

import '../pages/routers/index_routers.dart';


class Routers{
  static List<GetPage> getAllRouts(){
    return [
      ...IndexPages.routes
    ];
  }
}