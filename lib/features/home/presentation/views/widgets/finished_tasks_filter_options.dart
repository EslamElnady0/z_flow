import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';
import 'custom_pop_up_menu_item.dart';

class FinishedTasksFilterOptions extends StatelessWidget {
  const FinishedTasksFilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
            },
            title: AppTexts.lastDay,
            icon: null),
        SizedBox(
          height: 5.h,
        ),
        const Divider(
          color: Colors.white,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
            },
            title: AppTexts.last7Days,
            icon: null),
        SizedBox(
          height: 5.h,
        ),
        const Divider(
          color: Colors.white,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
            },
            title: AppTexts.last28Days,
            icon: null),
      ],
    );
  }
}
