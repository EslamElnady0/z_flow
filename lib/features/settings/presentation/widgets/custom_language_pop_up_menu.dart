import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/core%20cubits/localization%20cubit/localization_cubit.dart';
import 'package:z_flow/core/utils/helper%20enums/language_enum.dart';
import 'package:z_flow/core/utils/shared_pref_helper.dart';
import '../../../../core/constants/assets.dart';
import '../../../../generated/l10n.dart';

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
              value: "ar",
              onTap: () {
                context
                    .read<LocalizationCubit>()
                    .changeAppLanguage(LanguageEnum.arabic);
              },
              child: Text(S.of(context).arabic),
            ),
            PopupMenuItem(
              value: "en",
              onTap: () {
                context
                    .read<LocalizationCubit>()
                    .changeAppLanguage(LanguageEnum.english);
              },
              child: Text(S.of(context).english),
            ),
          ];
        });
  }
}
