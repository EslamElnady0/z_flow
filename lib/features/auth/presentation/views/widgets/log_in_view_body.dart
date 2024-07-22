import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_footer.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/login_form.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({
    super.key,
  });

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: LoginForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController)),
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
