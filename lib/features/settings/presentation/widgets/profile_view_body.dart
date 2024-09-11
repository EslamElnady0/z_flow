import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/auth/data/models/user_model.dart';
import 'package:z_flow/features/settings/presentation/account%20cubit/accout_cubit.dart';
import 'package:z_flow/features/settings/presentation/widgets/account_view_form.dart';

import '../../../../core/constants/constants.dart';
import '../../../../generated/l10n.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    firstNameController = TextEditingController(
        text: getIt
            .get<FirebaseAuth>()
            .currentUser
            ?.displayName
            ?.split(" ")
            .first);
    lastNameController = TextEditingController(
        text: getIt
            .get<FirebaseAuth>()
            .currentUser
            ?.displayName
            ?.split(" ")
            .last);
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AccountViewForm(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                formKey: formKey),
            CustomButton(
              text: S.of(context).save,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  if (getIt.get<InternetCheckCubit>().isDeviceConnected) {
                    UserModel? user = context.read<AccountCubit>().userModel;
                    if (user != null) {
                      user.firstName = firstNameController.text;
                      user.lastName = lastNameController.text;
                      if (context.read<AccountCubit>().filePath != null) {
                        await context
                            .read<AccountCubit>()
                            .uploadUserPhotoToFirebaseStorage(
                                file: File(
                                    context.read<AccountCubit>().filePath!),
                                isAnonymous: getIt
                                    .get<FirebaseAuth>()
                                    .currentUser!
                                    .isAnonymous,
                                isConnected: getIt
                                    .get<InternetCheckCubit>()
                                    .isDeviceConnected,
                                path:
                                    "profilePic/${getIt.get<FirebaseAuth>().currentUser!.uid}");
                        user.photoUrl = context.read<AccountCubit>().photoUrl;
                      }
                    }
                    await context.read<AccountCubit>().updateUserData(
                          user: user!,
                          isAnonymous: getIt
                              .get<FirebaseAuth>()
                              .currentUser!
                              .isAnonymous,
                          isConnected:
                              getIt.get<InternetCheckCubit>().isDeviceConnected,
                        );
                    getIt.get<FirebaseAuth>().currentUser!.updateDisplayName(
                        "${firstNameController.text} ${lastNameController.text}");
                    Fluttertoast.showToast(
                      msg: S.of(context).successfullyUpdated,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.green,
                      fontSize: 16.sp,
                      gravity: ToastGravity.BOTTOM,
                    );
                    setState(() {});
                  } else {
                    Fluttertoast.showToast(
                      msg: S.of(context).youAreNotConnectedToTheInternet,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.red,
                      fontSize: 16.sp,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
                }
              },
              raduis: 16.r,
              gradient: Constants.customButtonGradient,
            ),
          ],
        ),
      ),
    );
  }
}
