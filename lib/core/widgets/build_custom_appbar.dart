import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

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
      IconButton(onPressed: onActionPressed, icon: const Icon(Icons.search))
    ],
  );
}
