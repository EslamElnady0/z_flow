import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';

import '../../../../../core/styles/styles.dart';

class TimeOfUseListTileSubtitle extends StatelessWidget {
  const TimeOfUseListTileSubtitle({
    super.key,
    required List<AppUsageInfo> infos,
    required this.totalUsageTime,
    required this.index,
  }) : _infos = infos;

  final List<AppUsageInfo> _infos;
  final int totalUsageTime;
  final int index;
  usageBarColor(double value) {
    switch (value) {
      case >= 0.75:
        return Colors.red;
      case >= 0.5:
        return Colors.orange;
      case >= 0.25:
        return ColorManager.lightCyan;
      default:
        return ColorManager.lightgreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 210.w,
              height: 8.h,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(4.r)),
            ),
            Container(
              width: 210.w * (_infos[index].usage.inSeconds / totalUsageTime),
              height: 8.h,
              decoration: BoxDecoration(
                  color: usageBarColor(
                      _infos[index].usage.inSeconds / totalUsageTime),
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "${((_infos[index].usage.inSeconds / totalUsageTime) * 100).toStringAsFixed(1)}%",
          style: Styles.style15w400
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        )
      ],
    );
  }
}
