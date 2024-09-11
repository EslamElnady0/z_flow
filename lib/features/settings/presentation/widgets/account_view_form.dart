import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import 'package:z_flow/generated/l10n.dart';

class AccountViewForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final GlobalKey<FormState> formKey;
  const AccountViewForm(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            S.of(context).informationAboutYourAccount,
            style: Styles.style16W600grey.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            S.of(context).youCanManageAndModifyYourAccountOnThisPage,
            style: Styles.style12w400grey,
          ),
          SizedBox(
            height: 18.h,
          ),
          CircleAvatar(
            radius: 30.r,
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            getIt.get<FirebaseAuth>().currentUser?.displayName ?? "",
            style: Styles.style20W600.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomAuthTextField(
                    hintText: S.of(context).firstName,
                    icon: FontAwesomeIcons.circleUser,
                    controller: firstNameController),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: CustomAuthTextField(
                    hintText: S.of(context).lastName,
                    icon: FontAwesomeIcons.circleUser,
                    controller: lastNameController),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
