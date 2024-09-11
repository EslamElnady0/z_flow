import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/utils/show_cloudy_dialog.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';

void showUnauthenticatedDialog(BuildContext context) async {
  await showCloudyDialog(
      widget: buildUnAuthenticatedDialogBody(context), context: context);
}

Widget buildUnAuthenticatedDialogBody(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 20.h,
      ),
      Image.asset(
        Assets.unauthenticatedDialogImage,
        height: 163.h,
        width: 163.w,
      ),
      Text(
        S.of(context).accessYourAccount,
        style: Styles.style26W600,
      ),
      Text(
        S.of(context).logInFirstDescription,
        textAlign: TextAlign.center,
        style: Styles.style15w400.copyWith(color: Colors.black),
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.auth,
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 100.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: Constants.customButtonGradient),
            child: Text(
              S.of(context).logIn,
              style: Styles.style22W600,
            )),
      ),
      SizedBox(
        height: 24.h,
      ),
    ],
  );
}
