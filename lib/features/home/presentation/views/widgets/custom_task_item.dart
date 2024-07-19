import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';

class CustomTaskItem extends StatelessWidget {
  const CustomTaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Transform.scale(
        scale: 1.2,
        child: Checkbox(
          value: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          activeColor: ColorManager.primaryColor,
          onChanged: (value) {},
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 50.h,
        width: 290.w,
        decoration: BoxDecoration(
            gradient: Constants.customItemsGradient,
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          children: [
            SizedBox(
              width: 13.w,
            ),
            SizedBox(
              width: 220.w,
              child: Text(
                "Tessdfsjfskfj;lsks;lf;klsfklsfl;sf;lskf;lsfk;lkf;lsdkfksd;fkslkf;sdlfksdfsddssks;ldkk;t",
                overflow: TextOverflow.ellipsis,
                style: Styles.style16W600grey
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
            const Spacer(),
            PopupMenuButton(itemBuilder: (context) {
              return [];
            })
          ],
        ),
      )
    ]);
  }
}
