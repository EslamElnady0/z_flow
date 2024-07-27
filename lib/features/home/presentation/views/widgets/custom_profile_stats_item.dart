import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/styles/styles.dart';

class CustomProfileStatsItem extends StatelessWidget {
  final String title;
  final String completedText;
  final String pendingText;
  final List completed;
  final List onGoing;
  const CustomProfileStatsItem({
    super.key,
    required this.title,
    required this.completedText,
    required this.pendingText,
    required this.completed,
    required this.onGoing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Styles.style20W700white),
              SvgPicture.asset(
                Assets.settingsIcon,
                height: 20.h,
                width: 20.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: Row(
                      children: [
                        Text(completedText,
                            style: Styles.style16W500grey
                                .copyWith(color: Colors.white)),
                        const Spacer(),
                        Text(
                          completed.length.toString(),
                          style: Styles.style16W600grey
                              .copyWith(color: ColorManager.primaryColorAccent),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 160.w,
                    child: Row(
                      children: [
                        Text(pendingText,
                            style: Styles.style16W500grey
                                .copyWith(color: Colors.white)),
                        const Spacer(),
                        Text(
                          onGoing.length.toString(),
                          style: Styles.style16W600grey
                              .copyWith(color: ColorManager.primaryColorAccent),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                  height: 80.h,
                  width: 80.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        color: ColorManager.primaryColorAccent,
                        strokeWidth: 7,
                        value: completed.isEmpty
                            ? 0
                            : completed.length /
                                (onGoing.length + completed.length),
                      ),
                      Center(
                          child: Text(
                        "${completed.isEmpty ? 0 : (completed.length / (onGoing.length + completed.length) * 100).round()}%",
                        style: Styles.style24W600
                            .copyWith(color: ColorManager.primaryColorAccent),
                      ))
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
      ],
    );
  }
}
