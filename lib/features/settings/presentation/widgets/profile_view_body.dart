import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
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
              onTap: () {},
              raduis: 16.r,
              gradient: Constants.customButtonGradient,
            ),
          ],
        ),
      ),
    );
  }
}
