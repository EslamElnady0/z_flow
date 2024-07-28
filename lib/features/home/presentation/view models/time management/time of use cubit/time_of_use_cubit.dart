import 'dart:developer';

import 'package:app_usage/app_usage.dart';
import 'package:bloc/bloc.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:meta/meta.dart';

part 'time_of_use_state.dart';

class TimeOfUseCubit extends Cubit<TimeOfUseState> {
  TimeOfUseCubit() : super(TimeOfUseInitial());

  List<AppUsageInfo> infos = [];
  int totalUsageTime = 0;

  Future<List> getInstalledUsedApps(List<String>? packageNameList) async {
    var finalList = [];

    for (var appPackage in packageNameList!) {
      AppInfo app = await InstalledApps.getAppInfo(
        appPackage,
      );

      finalList.add(app);
    }
    return finalList;
  }

  Future<List<dynamic>>? getInstalledUsedAppHelper(
      {required int startDay}) async {
    List<String>? packageNameList = await getUsageStats(startday: startDay);

    return await getInstalledUsedApps(packageNameList);
  }

  Future<List<String>?> getUsageStats({required int startday}) async {
    try {
      List<String> packageNameList = [];
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: startday));
      infos = await AppUsage().getAppUsage(startDate, endDate);

      infos.sort((a, b) => b.usage.inSeconds.compareTo(a.usage.inSeconds));

      packageNameList =
          List.generate(infos.length, (index) => infos[index].packageName);

      return packageNameList;
    } catch (exception) {
      log(exception.toString());
      return null;
    }
  }
}
