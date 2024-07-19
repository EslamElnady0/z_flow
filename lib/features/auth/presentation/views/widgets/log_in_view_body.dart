import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/auth_screens_header.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_footer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

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
                  height: 25.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.email,
                    icon: Icons.email_outlined,
                    controller: TextEditingController()),
                SizedBox(
                  height: 25.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.password,
                    icon: Icons.lock_outline,
                    controller: TextEditingController()),
                SizedBox(
                  height: 12.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.forgotPassword);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      AppTexts.forgotPassword,
                      style: Styles.style12w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  gradient: Constants.customButtonGradient,
                  text: AppTexts.logIn,
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
                  const CustomAuthFooter(),
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
