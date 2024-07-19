import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import '../../../../../core/styles/styles.dart';
import 'blinking_profile_auth_button.dart';
import 'profile_google_sign_in_button.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: AppTexts.welcome, style: Styles.style20W700white),
          TextSpan(
              text: AppTexts.user,
              style: Styles.style20W700white
                  .copyWith(color: ColorManager.primaryColorAccent)),
          TextSpan(text: AppTexts.toZFlow, style: Styles.style20W700white),
        ])),
        SizedBox(
          height: 12.h,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 41.r,
          child: Image.asset(
            Assets.defaultProfile,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 47.w),
          child: Row(children: [
            const Expanded(
                child: BlinkingProfileAuthButton(
              text: AppTexts.signUp,
            )),
            SizedBox(
              width: 8.w,
            ),
            const Expanded(
                child: BlinkingProfileAuthButton(
              text: AppTexts.logIn,
            )),
          ]),
        ),
        SizedBox(
          height: 12.h,
        ),
        const ProfileGoogleSignInButton(),
        SizedBox(
          height: 18.h,
        )
      ],
    );
  }
}
