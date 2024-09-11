import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20out%20cubit/log_out_cubit.dart';
import '../../../../../core/styles/styles.dart';
import 'custom_logout_button.dart';

class SignedInAccountSection extends StatelessWidget {
  const SignedInAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogOutCubit>(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: S.of(context).welcome, style: Styles.style20W700white),
              TextSpan(
                  text:
                      "${getIt.get<FirebaseAuth>().currentUser!.displayName?.split(" ")[0] ?? "user"} ",
                  style: Styles.style20W700white
                      .copyWith(color: ColorManager.primaryColorAccent)),
              TextSpan(
                  text: S.of(context).toZFlow, style: Styles.style20W700white),
            ])),
            SizedBox(
              height: 12.h,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 41.r,
              backgroundImage:
                  getIt.get<FirebaseAuth>().currentUser!.photoURL == null ||
                          getIt.get<FirebaseAuth>().currentUser!.photoURL == ""
                      ? const AssetImage(
                          Assets.defaultProfile,
                        )
                      : CachedNetworkImageProvider(
                          getIt.get<FirebaseAuth>().currentUser!.photoURL ?? "",
                        ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
                getIt.get<FirebaseAuth>().currentUser?.displayName ??
                    "unknown user",
                style: Styles.style20W700white
                    .copyWith(color: ColorManager.primaryColorAccent)),
            SizedBox(
              height: 20.h,
            ),
            const CustomLogOutButton(),
            SizedBox(
              height: 20.h,
            )
          ],
        );
      }),
    );
  }
}
