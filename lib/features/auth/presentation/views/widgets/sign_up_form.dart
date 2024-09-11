import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/sigup_button_bloc_provider.dart';

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
                S.of(context).getStarted,
                style: Styles.style14w400
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                S.of(context).signUpToUnlock,
                style: Styles.style14w400,
                textAlign: TextAlign.center,
              )
            ],
          )),
          SizedBox(
            height: 20.h,
          ),
          CustomAuthTextField(
              hintText: S.of(context).firstName,
              icon: FontAwesomeIcons.circleUser,
              controller: firstNameController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: S.of(context).lastName,
              icon: FontAwesomeIcons.circleUser,
              controller: lastNameController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: S.of(context).email,
              icon: Icons.email_outlined,
              controller: emailController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: S.of(context).password,
              icon: Icons.lock_outline,
              isPassword: true,
              controller: passwordController),
          SizedBox(
            height: 16.h,
          ),
          CustomAuthTextField(
              hintText: S.of(context).confirmPassword,
              icon: Icons.lock_outline,
              isPassword: true,
              controller: confirmPasswordController),
          SizedBox(
            height: 30.h,
          ),
          Hero(
            tag: "signUp-button",
            child: Material(
                type: MaterialType.transparency,
                child: SigupButtonBlocProvider(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController)),
          ),
        ],
      ),
    );
  }
}
