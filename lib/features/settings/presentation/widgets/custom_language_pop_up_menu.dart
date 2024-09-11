import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import '../../../../core/constants/assets.dart';
import 'custom_language_menu.dart';

class CustomLanguagePopUpMenu extends StatefulWidget {
  final GlobalKey actionKey;
  const CustomLanguagePopUpMenu({super.key, required this.actionKey});

  @override
  State<CustomLanguagePopUpMenu> createState() =>
      _CustomLanguagePopUpMenuState();
}

class _CustomLanguagePopUpMenuState extends State<CustomLanguagePopUpMenu> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BuildOverlayMenu.showOverlay(context, widget.actionKey,
            widget: const CustomLanguageMenu(),
            gradient: Constants.customItemsGradient,
            positionOffset: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            width: 120.w);
      },
      child: SvgPicture.asset(
        Assets.iosArrowForwardSmall,
        key: widget.actionKey,
        height: 24.h,
        width: 24.w,
        color: Colors.white,
      ),
    );
  }
}
