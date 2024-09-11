import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

import '../../../../generated/l10n.dart';
import '../widgets/about_view_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const AboutViewBody(),
      appBar: buildInnerPagesAppBar(text: S.of(context).about),
    );
  }
}
