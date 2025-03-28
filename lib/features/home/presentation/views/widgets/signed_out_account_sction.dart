import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/styles/styles.dart';
import 'blinking_profile_auth_button.dart';
import 'profile_google_sign_in_button.dart';

class SignedOutAccountSction extends StatelessWidget {
  const SignedOutAccountSction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: S.of(context).welcome, style: Styles.style20W700white),
          TextSpan(
              text: S.of(context).user,
              style: Styles.style20W700white
                  .copyWith(color: ColorManager.primaryColorAccent)),
          TextSpan(text: S.of(context).toZFlow, style: Styles.style20W700white),
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
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(children: [
            Expanded(
                child: BlinkingProfileAuthButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.signUp);
              },
              text: S.of(context).signUp,
            )),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
                child: BlinkingProfileAuthButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.logIn);
              },
              text: S.of(context).logIn,
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
