import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets.dart';

class NoHabitsBody extends StatelessWidget {
  const NoHabitsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Image.asset(
          Assets.noHabitsImage,
          width: 160.w,
        ),
      ],
    );
  }
}
