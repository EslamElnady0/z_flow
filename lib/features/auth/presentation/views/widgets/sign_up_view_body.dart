import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';

import 'auth_screens_header.dart';
import 'custom_auth_footer.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthScreensHeader(),
                SizedBox(
                  height: 20.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.firstName,
                    icon: FontAwesomeIcons.circleUser,
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.lastName,
                    icon: FontAwesomeIcons.circleUser,
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.email,
                    icon: Icons.email_outlined,
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.password,
                    icon: Icons.lock_outline,
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.confirmPassword,
                    icon: Icons.lock_outline,
                    controller: TextEditingController()),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  gradient: Constants.customButtonGradient,
                  text: AppTexts.signUp,
                  raduis: 16.r,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const Spacer(),
                  const CustomAuthFooter(
                    backExists: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
