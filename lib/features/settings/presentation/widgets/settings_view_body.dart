import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import '../ui model/settings_item_model.dart';
import 'custom_settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingsItemModel> settingsItems;
    settingsItems = [
      SettingsItemModel(title: S.of(context).account, icon: Assets.accoutIcon),
      SettingsItemModel(
          title: S.of(context).language, icon: Assets.iosArrowForwardSmall),
      SettingsItemModel(title: S.of(context).shareApp, icon: Assets.share),
      SettingsItemModel(
          title: S.of(context).about, icon: Assets.iosArrowForwardSmall),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            S.of(context).controlAppSettings,
            style: Styles.style14w400,
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                GlobalKey actionKey = GlobalKey();
                return CustomSettingsItem(
                  model: settingsItems[index],
                  actionKey: actionKey,
                  index: index,
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, AppRouter.profile);
                        break;
                      case 2:
                        Share.share(
                            "check out app at https://drive.google.com/file/d/1u0DgllF0c3cTtG5cZSxb4j72fy37sgIB/view?usp=drive_link");
                        break;
                      case 3:
                        Navigator.pushNamed(context, AppRouter.about);

                        break;
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: settingsItems.length,
            ),
          )
        ],
      ),
    );
  }
}
