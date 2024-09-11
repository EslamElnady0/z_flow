import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/constants/assets.dart';

class CustomLanguagePopUpMenu extends StatelessWidget {
  const CustomLanguagePopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.zero,
        child: SvgPicture.asset(
          Assets.iosArrowForwardSmall,
          height: 24.h,
          width: 24.w,
          color: Colors.white,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              onTap: () {},
              child:
                  //TODO: Will compare stored locale with value of pop up menu and then build child
                  Text(AppTexts.arabic),
            ),
            PopupMenuItem(
              onTap: () {},
              child: Text(AppTexts.english),
            ),
          ];
        });
  }
}
