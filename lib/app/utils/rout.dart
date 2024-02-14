import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/app/pages/Select_Category/state.dart';
import 'package:todo/app/pages/Select_Category/view.dart';
import 'package:todo/app/pages/add_task/view.dart';
import 'package:todo/app/pages/edit_task/view.dart';
import 'package:todo/app/pages/home/view.dart';
import 'package:todo/app/pages/login/view.dart';
import 'package:todo/app/pages/todays_task/view.dart';

import '../pages/task_add/view.dart';

abstract class AppRoutes {
  static const HOMESCREAN = '/homescrean';
  static const LOGINSCREAN = '/loginscrean';
  static const TODAYSTASK = '/todaystaks';
  static const ADDTASK = '/addtask';
  static const SELECTCATEGORY = '/selectcategory';
  static const TASKNAME = '/taskname';
  static const EDITTASK = '/edittask';
  static List<GetPage> route = [
    GetPage(
      name: AppRoutes.HOMESCREAN,
      page: () => const HomeScrean(),
    ),
    GetPage(
      name: AppRoutes.LOGINSCREAN,
      page: () => const LoginScrean(),
    ),
    GetPage(
      name: AppRoutes.TODAYSTASK,
      page: () => const TodaysTask(),
    ),
    GetPage(
      name: AppRoutes.ADDTASK,
      page: () => const AddTask(),
    ),
    GetPage(
      name: AppRoutes.SELECTCATEGORY,
      page: () => const SelecteCategory(),
    ),
    GetPage(
      name: AppRoutes.TASKNAME,
      page: () => const TaskAdd(),
    ),
    GetPage(
      name: AppRoutes.EDITTASK,
      page: () => EditTask(taskId: ""),
    ),
  ];
}
