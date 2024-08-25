import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';

import '../../../../../core/constants/assets.dart';
import 'finished_tasks_filter_options.dart';

class CustomFilterRow extends StatefulWidget {
  const CustomFilterRow({super.key});

  @override
  State<CustomFilterRow> createState() => _CustomFilterRowState();
}

class _CustomFilterRowState extends State<CustomFilterRow> {
  GlobalKey actionKey = GlobalKey();
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppTexts.filter,
          style: Styles.style20W600.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            BuildOverlayMenu.showOverlay(context, actionKey,
                widget: FinishedTasksFilterOptions());
          },
          child: SvgPicture.asset(
            key: actionKey,
            Assets.settingsIcon,
            height: 16.h,
            width: 16.w,
          ),
        ),
      ],
    );
  }
}
