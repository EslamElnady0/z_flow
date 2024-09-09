import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import '../../../../../core/routes/app_router.dart';

class CustomGoogleAuthButton extends StatelessWidget {
  const CustomGoogleAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) async {
        if (state is LogInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildCustomSnackBar(message: "Logged in successfully"),
          );
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              buildCustomSnackBar(message: state.errMessage, isError: true));
        }
      },
      child: BlocBuilder<LogInCubit, LogInState>(
        builder: (context, state) {
          return CustomButton(
            onTap: () async {
              await context.read<LogInCubit>().signInWithGoogle();
            },
            height: 44.h,
            alignment: Alignment.center,
            innerShadow: [
              BoxShadow(
                  offset: const Offset(-2, -2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25)),
            ],
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            child: BlocBuilder<LogInCubit, LogInState>(
              builder: (context, state) {
                if (state is LogInLoading) {
                  return SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      color: ColorManager.primaryColorAccent,
                    ),
                  );
                } else {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Google",
                          style:
                              Styles.style14w400.copyWith(color: Colors.black)),
                      SizedBox(width: 30.w),
                      SvgPicture.asset(Assets.googleLogo,
                          height: 20.h, width: 20.w)
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
