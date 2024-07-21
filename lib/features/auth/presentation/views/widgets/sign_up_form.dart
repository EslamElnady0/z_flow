import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';

import '../../../../../core/styles/styles.dart';
import 'auth_screens_header.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  const SignUpForm(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.firstNameController,
      required this.lastNameController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthScreensHeader(
              text: Column(
            children: [
              Text(
                AppTexts.getStarted,
                style: Styles.style14w400
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                AppTexts.signUpToUnlock,
                style: Styles.style14w400,
                textAlign: TextAlign.center,
              )
            ],
          )),
          SizedBox(
            height: 20.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.firstName,
              icon: FontAwesomeIcons.circleUser,
              controller: firstNameController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.lastName,
              icon: FontAwesomeIcons.circleUser,
              controller: lastNameController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.email,
              icon: Icons.email_outlined,
              controller: emailController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.password,
              icon: Icons.lock_outline,
              controller: passwordController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.confirmPassword,
              icon: Icons.lock_outline,
              controller: confirmPasswordController),
          SizedBox(
            height: 30.h,
          ),
          Hero(
            tag: "signUp-button",
            child: Material(
              type: MaterialType.transparency,
              child: CustomButton(
                gradient: Constants.customButtonGradient,
                text: AppTexts.signUp,
                raduis: 16.r,
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
