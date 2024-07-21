import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/inner_shadow.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  const CustomCheckBox({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: InnerShadow(
        shadows: [
          BoxShadow(
              offset: const Offset(
                0,
                5.4,
              ),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5.4)
        ],
        child: Checkbox(
          value: false,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
          activeColor: ColorManager.primaryColor,
          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(color: ColorManager.primaryColor);
            } else {
              return const BorderSide(color: Colors.white);
            }
          }),
          fillColor: const WidgetStatePropertyAll(Colors.white),
          onChanged: onChanged,
        ),
      ),
    );
  }
}