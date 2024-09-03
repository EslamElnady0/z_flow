import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

class NoTasksBody extends StatelessWidget {
  const NoTasksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Image.asset(
            Assets.noTasksImage,
            width: 160.w,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
