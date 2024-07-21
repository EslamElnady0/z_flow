import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../data/repos/auth_repo_impl.dart';

class CustomGoogleAuthButton extends StatelessWidget {
  const CustomGoogleAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () async {
        await AuthRepoImpl(
                firebaseAuth: getIt.get<FirebaseAuth>(),
                firestore: getIt.get<FirebaseFirestore>())
            .signInWithGoogle();
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Google",
              style: Styles.style14w400.copyWith(color: Colors.black)),
          SizedBox(width: 30.w),
          SvgPicture.asset(Assets.googleLogo, height: 20.h, width: 20.w)
        ],
      ),
    );
  }
}
