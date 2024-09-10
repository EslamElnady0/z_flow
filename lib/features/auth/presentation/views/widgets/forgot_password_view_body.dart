import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/view%20models/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_footer.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';

import 'forgot_password_header.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                const ForgotPasswordHeader(),
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
                      child: Form(
                        key: formKey,
                        child: CustomAuthTextField(
                            hintText: AppTexts.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please, enter your email";
                              } else if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return "Please, enter a valid email form";
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.email_outlined,
                            controller: emailController),
                      ),
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
                Hero(
                  tag: "logIn-button",
                  child: Material(
                    type: MaterialType.transparency,
                    child: CustomButton(
                      text: AppTexts.confirm,
                      gradient: Constants.customButtonGradient,
                      raduis: 16.r,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context
                              .read<ForgetPasswordCubit>()
                              .sendPasswordResetEmail(
                                  email: emailController.text);
                          Fluttertoast.showToast(
                              msg: AppTexts.sentPasswordResetEmail +
                                  emailController.text);
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 16.h,
                ),
                const CustomAuthFooter(
                  skipExists: false,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
