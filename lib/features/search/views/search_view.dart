import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/search/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as int;
    return CustomScaffold(
      body: SearchViewBody(flag: args),
    );
  }
}
