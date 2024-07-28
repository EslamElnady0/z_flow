import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';

class TimeOfUseListTileTitle extends StatelessWidget {
  const TimeOfUseListTileTitle(
      {super.key,
      required List<AppUsageInfo> infos,
      required this.snapshot,
      required this.index})
      : _infos = infos;

  final List<AppUsageInfo> _infos;
  final int index;
  final AsyncSnapshot<List<dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130.w,
          child: Text(
            "${snapshot.data![index].name}",
            style: Styles.style18w600
                .copyWith(color: Colors.white, fontSize: 16.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Text(
          "${_infos[index].usage.inHours} ",
          style: Styles.style12w600grey,
        ),
        Text(
          "${AppTexts.hours} ",
          style: Styles.style12w600grey,
        ),
        Text(
          "${_infos[index].usage.inMinutes.remainder(60).toString().padLeft(2, '0')} ",
          style: Styles.style12w600grey,
        ),
        Text(
          AppTexts.minutes,
          style: Styles.style12w600grey,
        ),
      ],
    );
  }
}
