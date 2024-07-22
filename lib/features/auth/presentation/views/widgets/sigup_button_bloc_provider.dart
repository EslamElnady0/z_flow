import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/view%20models/sign%20up%20cubit/sign_up_cubit.dart';

class SigupButtonBlocProvider extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  const SigupButtonBlocProvider(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SignUpCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(
                    message: "Account Created Successfully"));
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
              } else if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(
                    message: state.errMessage,
                    backgroundColor: ColorManager.red));
              }
            },
            child: CustomButton(
              gradient: Constants.customButtonGradient,
              text: AppTexts.signUp,
              raduis: 16.r,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await context.read<SignUpCubit>().signUpWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text);
                }
              },
            ));
      }),
    );
  }
}
