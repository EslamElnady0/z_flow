import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/features/home/presentation/views/widgets/all_habits_duration_options.dart';

import '../../../../../core/constants/assets.dart';

class CustomHabitsFilterRow extends StatefulWidget {
  const CustomHabitsFilterRow({super.key});

  @override
  State<CustomHabitsFilterRow> createState() => _CustomHabitsFilterRowState();
}

class _CustomHabitsFilterRowState extends State<CustomHabitsFilterRow> {
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
          S.of(context).filter,
          style: Styles.style20W600.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            BuildOverlayMenu.showOverlay(context, actionKey,
                widget: const AllHabitsDurationOptions());
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
