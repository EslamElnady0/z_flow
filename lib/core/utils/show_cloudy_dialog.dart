import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

Future<void> showCloudyDialog(
    {required Widget widget, required BuildContext context}) async {
  await showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: Constants.customCloudyGradient),
              child: widget),
        );
      });
}
