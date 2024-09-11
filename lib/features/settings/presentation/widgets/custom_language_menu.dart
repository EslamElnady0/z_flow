import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/core%20cubits/localization%20cubit/localization_cubit.dart';
import 'package:z_flow/core/utils/helper%20enums/language_enum.dart';
import 'package:z_flow/core/widgets/build_overlay_menu.dart';
import 'package:z_flow/generated/l10n.dart';

import 'langueage_item.dart';

class CustomLanguageMenu extends StatelessWidget {
  const CustomLanguageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageItem(
            lang: "en",
            text: S.of(context).english,
            onTap: () {
              context
                  .read<LocalizationCubit>()
                  .changeAppLanguage(LanguageEnum.english);
              BuildOverlayMenu.removeOverlay();
            }),
        SizedBox(
          height: 8.h,
        ),
        LanguageItem(
            lang: "ar",
            text: S.of(context).arabic,
            onTap: () {
              context
                  .read<LocalizationCubit>()
                  .changeAppLanguage(LanguageEnum.arabic);
              BuildOverlayMenu.removeOverlay();
            })
      ],
    );
  }
}
