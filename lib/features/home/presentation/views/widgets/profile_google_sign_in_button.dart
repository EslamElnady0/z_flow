import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/build_custom_snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';

class ProfileGoogleSignInButton extends StatelessWidget {
  const ProfileGoogleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
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
      child: CustomButton(
          onTap: () async {
            await context.read<LogInCubit>().signInWithGoogle();
          },
          height: 44.h,
          alignment: Alignment.center,
          raduis: 12.r,
          innerShadow: [
            BoxShadow(
                offset: const Offset(-2, -2),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25)),
          ],
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 47.w),
          child: BlocBuilder<LogInCubit, LogInState>(builder: (context, state) {
            if (state is LogInLoading) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const CircularProgressIndicator(
                  color: ColorManager.primaryColorAccent,
                ),
              );
            } else {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.googleLogo,
                      height: 20.h, width: 20.w),
                  SizedBox(width: 25.w),
                  Text(AppTexts.continueWithGoogle,
                      style: Styles.style20W600
                          .copyWith(color: const Color(0xff202020))),
                ],
              );
            }
          })),
    );
  }
}
