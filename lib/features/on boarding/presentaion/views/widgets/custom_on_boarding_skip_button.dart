import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/generated/l10n.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomHollowButton extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final double? height;
  final void Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const CustomHollowButton({
    super.key,
    this.text,
    this.onTap,
    this.margin,
    this.style,
    this.height,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: margin,
      height: height,
      padding: padding,
      onTap: onTap,
      raduis: 16.r,
      border: Border.all(color: color ?? ColorManager.primaryColor, width: 2),
      color: Colors.transparent,
      child: Center(
        child: Text(
          text ?? S.of(context).skip,
          style: style ??
              Styles.style20W700white
                  .copyWith(color: color ?? ColorManager.primaryColor),
        ),
      ),
    );
  }
}
