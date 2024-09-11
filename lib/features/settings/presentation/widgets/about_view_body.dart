import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import 'custom_contributer_item.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            S.of(context).effortlesslyManageYourLife,
            style: Styles.style14w400,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomContributerItem(
              image: Assets.adelUiUx, name: "Adel Gabr"),
          SizedBox(
            height: 22.h,
          ),
          const CustomContributerItem(
              image: Assets.eslamFlutter, name: "Eslam Elnady"),
          SizedBox(
            height: 60.h,
          )
        ],
      ),
    );
  }
}
