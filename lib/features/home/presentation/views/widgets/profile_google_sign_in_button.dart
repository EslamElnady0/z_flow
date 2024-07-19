import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class ProfileGoogleSignInButton extends StatelessWidget {
  const ProfileGoogleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.googleLogo, height: 20.h, width: 20.w),
          SizedBox(width: 25.w),
          Text(AppTexts.continueWithGoogle,
              style:
                  Styles.style20W600.copyWith(color: const Color(0xff202020))),
        ],
      ),
    );
  }
}
