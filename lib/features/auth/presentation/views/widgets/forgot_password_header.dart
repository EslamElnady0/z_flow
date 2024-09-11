import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Hero(
          tag: "logo",
          child: Image.asset(
            Assets.logoFullWord,
            height: 64.h,
            width: 103.w,
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          S.of(context).forgotPassword,
          style: Styles.style24W600.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          S.of(context).noWorries,
          textAlign: TextAlign.center,
          style: Styles.style14w400,
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          Assets.passwordImage,
          height: 50.h,
          width: 238.w,
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
