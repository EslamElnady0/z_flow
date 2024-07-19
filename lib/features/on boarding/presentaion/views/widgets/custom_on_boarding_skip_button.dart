import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomHollowButton extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final double? height;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  const CustomHollowButton({
    super.key,
    this.text,
    this.onTap,
    this.margin,
    this.style,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: margin,
      height: height,
      onTap: onTap,
      raduis: 16.r,
      border: Border.all(color: ColorManager.primaryColor, width: 2),
      color: Colors.transparent,
      child: Center(
        child: Text(
          text ?? "Skip",
          style: style ??
              Styles.style20W700white
                  .copyWith(color: ColorManager.primaryColor),
        ),
      ),
    );
  }
}
