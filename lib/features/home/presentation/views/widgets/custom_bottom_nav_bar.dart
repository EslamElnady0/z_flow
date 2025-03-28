import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/widgets/inner_shadow.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/bottom%20nav%20bar%20cubit/bottom_nav_bar_cubit.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../ui logic/ui models/bottom_nav_bar_item_model.dart';
import 'selected_bottom_nav_bar_item.dart';
import 'unselected_bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavBarItemModel> bottomNavBarItems;
    bottomNavBarItems = [
      BottomNavBarItemModel(title: S.of(context).tasks, icon: Assets.tasksIcon),
      BottomNavBarItemModel(
          title: S.of(context).calender, icon: Assets.calenderIcon),
      BottomNavBarItemModel(title: S.of(context).time, icon: Assets.timeIcon),
      BottomNavBarItemModel(
          title: S.of(context).habits, icon: Assets.habitsIcon),
      BottomNavBarItemModel(
          title: S.of(context).profile, icon: Assets.profileIcon),
    ];
    return InnerShadow(
      shadows: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
        )
      ],
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Container(
            height: 80.h,
            width: 375.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                color: ColorManager.primaryColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...bottomNavBarItems
                      .asMap()
                      .entries
                      .map((bottomNavModelEntry) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context
                            .read<BottomNavBarCubit>()
                            .changeIndex(bottomNavModelEntry.key);
                      },
                      child: context.read<BottomNavBarCubit>().selectedIndex ==
                              bottomNavModelEntry.key
                          ? SelectedBottomNavBarItem(
                              bottomNavModelEntry: bottomNavModelEntry,
                            )
                          : UnSelectedBottomNavBarItem(
                              bottomNavModelEntry: bottomNavModelEntry,
                            ),
                    );
                  })
                ]),
          );
        },
      ),
    );
  }
}
