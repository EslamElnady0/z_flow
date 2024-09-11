import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/styles.dart';

class CustomPopUpMenuItem extends StatelessWidget {
  const CustomPopUpMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.style,
  });

  final String title;
  final Widget? icon;
  final TextStyle? style;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Text(
                  title,
                  style: style ??
                      Styles.style16W600grey.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              : Flexible(
                  child: Text(
                    title,
                    style: style ??
                        Styles.style16W600grey.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
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
