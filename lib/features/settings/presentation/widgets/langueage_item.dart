import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../core/constants/constants.dart';

class LanguageItem extends StatelessWidget {
  final String lang;
  final String text;
  final VoidCallback onTap;
  const LanguageItem({
    super.key,
    required this.lang,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Intl.getCurrentLocale() == lang
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: Constants.customButtonGradient,
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: Styles.style18w600,
              ),
            )
          : Text(
              text,
              style: Styles.style18w600.copyWith(color: Colors.black),
            ),
    );
  }
}
