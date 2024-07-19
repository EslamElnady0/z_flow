import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_footer.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    Assets.logoFullWord,
                    height: 64.h,
                    width: 103.w,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  AppTexts.forgotPassword,
                  style: Styles.style24W600.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Reset your password if you've forgotten it. We'll help you regain access to your account.",
                  textAlign: TextAlign.center,
                  style: Styles.style14w400,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  Assets.passwordImage,
                  height: 50.h,
                  width: 238.w,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: Image.asset(
                        Assets.forgettingPerson,
                        height: 244.h,
                        width: 245.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 222.h),
                      child: CustomAuthTextField(
                          hintText: AppTexts.email,
                          icon: Icons.email_outlined,
                          controller: TextEditingController()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  text: AppTexts.logIn,
                  gradient: Constants.customButtonGradient,
                  raduis: 16.r,
                ),
                const Spacer(),
                SizedBox(
                  height: 16.h,
                ),
                const CustomAuthFooter(
                  skipExists: false,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
