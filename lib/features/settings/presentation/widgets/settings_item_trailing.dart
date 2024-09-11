import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/features/settings/presentation/widgets/custom_language_pop_up_menu.dart';

class SettingsItemTrailing extends StatelessWidget {
  final int index;
  final String icon;
  const SettingsItemTrailing({
    super.key,
    required this.index,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return index == 1
        ? const CustomLanguagePopUpMenu()
        : SvgPicture.asset(
            icon,
            height: 24.h,
            width: 24.w,
            color: Colors.white,
          );
  }
}
