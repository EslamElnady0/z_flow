import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../../data/models/link item model/link_item.dart';
import 'custom_link_chip.dart';

class CustomLinkItem extends StatelessWidget {
  final LinkItem linkItem;
  const CustomLinkItem({
    super.key,
    required this.linkItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: SvgPicture.asset(
            Assets.linksPin,
            color: Colors.white,
            height: 24.h,
            width: 24.w,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              linkItem.name,
              style: Styles.style20W700white,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              linkItem.description,
              style: Styles.style16W500grey,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomLinkChip(url: linkItem.url),
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
