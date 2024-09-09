import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';

class CustomLinkItemRow extends StatelessWidget {
  final String title;
  const CustomLinkItemRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.linksPin,
          color: Colors.black,
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          title,
          style: Styles.style16W500grey.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
