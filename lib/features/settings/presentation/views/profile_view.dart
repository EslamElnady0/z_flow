import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/settings/presentation/widgets/profile_view_body.dart';
import 'package:z_flow/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const ProfileViewBody(),
      appBar: buildInnerPagesAppBar(text: S.of(context).profile),
    );
  }
}
