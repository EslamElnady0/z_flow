import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

import '../styles/styles.dart';

PreferredSizeWidget? buildCustomAppBar(
    {required BuildContext context,
    required int index,
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
