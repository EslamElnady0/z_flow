import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';

import '../../../../core/styles/styles.dart';

class CustomEventItem extends StatelessWidget {
  final EventModel event;
  const CustomEventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          gradient: Constants.customItemsGradient,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SizedBox(
          width: 220.w,
          child: Text(
            event.title,
            overflow: TextOverflow.ellipsis,
            style: Styles.style16W600grey
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
