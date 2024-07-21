import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

class AuthScreensHeader extends StatelessWidget {
  final Widget text;
  const AuthScreensHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
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
            height: 10.h,
          ),
          const Spacer(),
          text,
          const Spacer(),
          SizedBox(
            height: 20.h,
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
