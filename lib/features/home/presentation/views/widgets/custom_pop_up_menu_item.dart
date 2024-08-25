import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/styles.dart';

class CustomPopUpMenuItem extends StatelessWidget {
  const CustomPopUpMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget? icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Styles.style16W600grey.copyWith(color: Colors.white),
          ),
          icon != null
              ? Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 10.w,
                      ),
                      icon!
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
