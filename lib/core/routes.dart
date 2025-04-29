
import 'package:get/get.dart';
import 'package:todo/views/pages/about.dart';

import '../views/pages/home.dart';

List<GetPage> routes = [
  GetPage(
    name: '/home',
    page: () => Home(),
    transition: Transition.native,
  ),
  GetPage(
    name: '/aboutTask',
    page: () => AboutTask(),
    transition: Transition.native,
  ),


];