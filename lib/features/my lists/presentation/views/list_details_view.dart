import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/list_details_view_body.dart';

class ListDetailsView extends StatelessWidget {
  const ListDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as LinksListModel;
    return CustomScaffold(
      appBar: buildInnerPagesAppBar(text: args.name),
      body: ListDetailsViewBody(linksList: args),
    );
  }
}
