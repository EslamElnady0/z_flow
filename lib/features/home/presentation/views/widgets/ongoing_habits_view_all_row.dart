import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/styles/styles.dart';

class HabitsViewAllRow extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const HabitsViewAllRow({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Styles.style16W500grey,
            ),
            Row(
              children: [
                Text(
                  S.of(context).viewAll,
                  style: Styles.style16W500grey,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
