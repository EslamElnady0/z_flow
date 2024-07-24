import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/inner_shadow.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool? value;
  const CustomCheckBox({super.key, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: InnerShadow(
        shadows: value!
            ? []
            : [
                BoxShadow(
                    offset: const Offset(
                      0,
                      5.4,
                    ),
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5.4)
              ],
        child: Checkbox(
          value: value,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
          activeColor: ColorManager.primaryColor,
          checkColor: Colors.white,
          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(color: ColorManager.primaryColor);
            } else {
              return const BorderSide(color: Colors.white);
            }
          }),
          fillColor: WidgetStatePropertyAll(
              value! ? ColorManager.primaryColor : Colors.white),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
