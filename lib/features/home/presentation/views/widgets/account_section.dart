import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/home/presentation/views/widgets/signed_out_account_sction.dart';

import 'signed_in_account_section.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt.get<FirebaseAuth>().userChanges(),
        builder: (builder, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 100.h),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (getIt.get<FirebaseAuth>().currentUser == null ||
              snapshot.data!.isAnonymous) {
            return const SignedOutAccountSction();
          } else if (getIt.get<FirebaseAuth>().currentUser != null) {
            return const SignedInAccountSection();
          } else {
            return const Center(child: Text("error"));
          }
        });
  }
}
