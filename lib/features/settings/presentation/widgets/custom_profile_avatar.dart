import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/features/settings/presentation/account%20cubit/accout_cubit.dart';
import '../../../../core/core cubits/internet check cubit/internet_check_cubit.dart';

class CustomProfileAvatar extends StatelessWidget {
  final VoidCallback onTap;
  const CustomProfileAvatar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white), shape: BoxShape.circle),
        child: Stack(
          alignment: Alignment.center,
          children: [
            context.read<AccountCubit>().filePath == null
                ? FutureBuilder(
                    future: context.read<AccountCubit>().getUserData(
                          isAnonymous: getIt
                              .get<FirebaseAuth>()
                              .currentUser!
                              .isAnonymous,
                          isConnected:
                              getIt.get<InternetCheckCubit>().isDeviceConnected,
                        ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          color: ColorManager.primaryColorAccent,
                        );
                      } else if (snapshot.data?.photoUrl != null &&
                          snapshot.connectionState == ConnectionState.done) {
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          radius: 30.r,
                          backgroundImage: CachedNetworkImageProvider(
                            snapshot.data!.photoUrl,
                          ),
                        );
                      } else {
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          radius: 30.r,
                        );
                      }
                    })
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    backgroundImage:
                        Image.file(File(context.read<AccountCubit>().filePath!))
                            .image,
                    radius: 30.r,
                  ),
            Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
              size: 18.r,
            ),
          ],
        ),
      ),
    );
  }
}
