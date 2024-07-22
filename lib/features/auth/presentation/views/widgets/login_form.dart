import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/auth_screens_header.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import '../../../../../core/routes/app_router.dart';
import 'login_button_bloc_provider.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

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
                AppTexts.welcomeBack,
                style: Styles.style14w400
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                AppTexts.pleaseLogin,
                style: Styles.style14w400,
                textAlign: TextAlign.center,
              )
            ],
          )),
          SizedBox(
            height: 25.h,
          ),
          CustomAuthTextField(
              hintText: AppTexts.email,
              icon: Icons.email_outlined,
              controller: emailController),
          SizedBox(
            height: 25.h,
          ),
          CustomAuthTextField(
              isPassword: true,
              hintText: AppTexts.password,
              icon: Icons.lock_outline,
              controller: passwordController),
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
          Hero(
            tag: "logIn-button",
            child: Material(
                type: MaterialType.transparency,
                child: LogInButtonBlocProvider(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController)),
          ),
        ],
      ),
    );
  }
}
