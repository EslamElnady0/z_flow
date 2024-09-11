import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../generated/l10n.dart';
import '../../ui logic/ui models/drawer_item_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> drawerItems;
    drawerItems = [
      DrawerItem(
          title: S.of(context).startWorkSession,
          icon: Assets.clock,
          route: AppRouter.workSession),
      DrawerItem(
          title: S.of(context).myLists,
          icon: Assets.list,
          route: AppRouter.myLists),
      DrawerItem(
          title: S.of(context).reminder,
          icon: Assets.reminder,
          route: AppRouter.reminder),
      // DrawerItem(
      //     title: S.of(context).stayAway,
      //     icon: Assets.lockSafety,
      //     route: AppRouter.stayAway),
      DrawerItem(
          title: S.of(context).myGoals,
          icon: Assets.goals,
          route: AppRouter.goals),
      DrawerItem(
          title: S.of(context).taskCats,
          icon: Assets.listWithArrows,
          route: AppRouter.taskCats),
      DrawerItem(
          title: S.of(context).favoriteTasks,
          icon: Assets.starOutLined,
          route: AppRouter.favTasks),
      DrawerItem(
          title: S.of(context).favoriteHabits,
          icon: Assets.starOutLined,
          route: AppRouter.favHabits),
      // DrawerItem(
      //     title: S.of(context).addHomeWidget, icon: Assets.addWidget, route: ""),
      // DrawerItem(
      //     title: S.of(context).financialSupport, icon: Assets.dollar, route: ""),
      DrawerItem(
          title: S.of(context).settings,
          icon: Assets.settingDrawer,
          route: AppRouter.settings_),
      DrawerItem(title: S.of(context).shareApp, icon: Assets.share, route: ""),
    ];
    return Drawer(
      shadowColor: ColorManager.primaryColorAccent,
      elevation: 30,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r))),
      child: Container(
        decoration: const BoxDecoration(gradient: Constants.drawerGradient),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Image.asset(
              Assets.logoFullWord,
              height: 74.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              thickness: 1.25,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: drawerItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: 12.w,
                        left: 12.w,
                        top: index == 0 ? 12.h : 0,
                        bottom: index == drawerItems.length - 1 ? 12.h : 0,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          gradient: Constants.customButtonGradient),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onTap: () {
                            if (index == drawerItems.length - 1) {
                              Share.share(
                                  "check out app at https://drive.google.com/file/d/1u0DgllF0c3cTtG5cZSxb4j72fy37sgIB/view?usp=drive_link");
                            } else {
                              Navigator.pushNamed(
                                  context, drawerItems[index].route);
                            }
                          },
                          leading: SvgPicture.asset(
                            drawerItems[index].icon,
                          ),
                          title: Text(
                            drawerItems[index].title,
                            style: Styles.style20W700white,
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
