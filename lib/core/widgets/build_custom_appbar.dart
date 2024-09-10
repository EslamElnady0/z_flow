import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/bottom%20nav%20bar%20cubit/bottom_nav_bar_cubit.dart';

import '../styles/styles.dart';

PreferredSizeWidget? buildCustomAppBar(
    {required BuildContext context,
    required void Function()? onActionPressed,
    required void Function()? onLeadingPressed}) {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      Assets.logoFullWord,
      height: 44.h,
      width: 93.w,
    ),
    leading: IconButton(
      onPressed: onLeadingPressed,
      icon: const Icon(Icons.menu),
    ),
    actions: [
      BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          if (context.read<BottomNavBarCubit>().selectedIndex == 0 ||
              context.read<BottomNavBarCubit>().selectedIndex == 3) {
            return IconButton(
                onPressed: onActionPressed, icon: const Icon(Icons.search));
          } else {
            return const SizedBox.shrink();
          }
        },
      )
    ],
  );
}

PreferredSizeWidget? buildInnerPagesAppBar({
  required String text,
}) {
  return AppBar(
    title: Text(
      text,
      style: Styles.style18w600,
    ),
    centerTitle: true,
    elevation: 0,
  );
}
