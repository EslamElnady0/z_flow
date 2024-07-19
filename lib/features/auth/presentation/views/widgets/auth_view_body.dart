import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_footer.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';

import '../../../../../core/routes/app_router.dart';
import 'auth_screens_header.dart';
import 'custom_google_auth_button.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: const AuthScreensHeader(),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomHollowButton(
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          text: AppTexts.logIn,
          style: Styles.style20W700white,
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.logIn);
          },
        ),
        SizedBox(
          height: 18.h,
        ),
        CustomButton(
          gradient: Constants.customButtonGradient,
          text: AppTexts.signUp,
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          raduis: 16.r,
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.signUp);
          },
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                endIndent: 15.w,
                indent: 15.w,
                color: Colors.white,
              ),
            ),
            Text(
              "or",
              style: Styles.style14w400.copyWith(color: Colors.white),
            ),
            Expanded(
                child:
                    Divider(endIndent: 15.w, indent: 15.w, color: Colors.white))
          ],
        ),
        SizedBox(
          height: 26.h,
        ),
        Text(AppTexts.youCanContinueWith, style: Styles.style16W400white),
        SizedBox(
          height: 26.h,
        ),
        const CustomGoogleAuthButton(),
        const Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.h, right: 18.w),
            child: const CustomAuthFooter(
              backExists: false,
            ),
          ),
        )
      ],
    );
  }
}
