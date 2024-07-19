import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';

class AuthScreensHeader extends StatelessWidget {
  const AuthScreensHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Hero(
          tag: "logo",
          child: Image.asset(
            Assets.logoFullWord,
            height: 107.h,
            width: 196.w,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Reset your password if you've forgotten it. We'll help you regain access to your account.",
          textAlign: TextAlign.center,
          style: Styles.style14w400,
        ),
        SizedBox(
          height: 30.h,
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
