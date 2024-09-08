import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20out%20cubit/log_out_cubit.dart';
import '../../../../../core/styles/styles.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      gradient: Constants.customButtonGradient,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
      ),
      style: Styles.style16W600grey.copyWith(color: Colors.white),
      onTap: () async {
        await context.read<LogOutCubit>().logOut();
      },
      raduis: 16.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.logOut,
            style: Styles.style20W700white,
          ),
          SvgPicture.asset(
            Assets.logOutIcon,
            height: 24.h,
            width: 24.w,
          )
        ],
      ),
    );
  }
}
