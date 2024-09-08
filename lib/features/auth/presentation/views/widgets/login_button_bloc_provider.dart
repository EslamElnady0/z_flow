import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.dart';

class LogInButtonBlocProvider extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogInButtonBlocProvider(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
        listener: (ctx, state) {
          if (state is LogInSuccess) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              buildCustomSnackBar(message: "Logged in successfully"),
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.home,
              (Route<dynamic> route) => false,
            );
          } else if (state is LogInFailure) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              buildCustomSnackBar(message: state.errMessage, isError: true),
            );
          }
        },
        child: CustomButton(
          gradient: Constants.customButtonGradient,
          text: AppTexts.logIn,
          raduis: 16.r,
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<LogInCubit>().signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
        ));
  }
}
