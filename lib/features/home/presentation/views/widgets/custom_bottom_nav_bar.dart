import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/inner_shadow.dart';
import 'package:z_flow/features/home/presentation/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import '../../../../../core/constants/colors.dart';
import 'selected_bottom_nav_bar_item.dart';
import 'unselected_bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ...Constants.bottomNavBarItems
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
