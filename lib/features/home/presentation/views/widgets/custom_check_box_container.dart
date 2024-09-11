import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';

class CustomCheckBoxContainer extends StatelessWidget {
  final String text;
  final void Function(bool?)? onChanged;
  final bool value;
  const CustomCheckBoxContainer(
      {super.key, required this.text, this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      padding: EdgeInsetsDirectional.only(start: 12.w),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: Constants.customButtonGradient,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.style18w600,
          ),
          CustomCheckBox(
            onChanged: onChanged,
            value: value,
          )
        ],
      ),
    );
  }
}
