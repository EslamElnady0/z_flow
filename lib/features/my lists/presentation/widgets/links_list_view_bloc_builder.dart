import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/get%20links%20lists%20cubit/get_links_lists_cubit.dart';

import 'custom_link_item.dart';

class LinksListViewBlocBuilder extends StatelessWidget {
  final LinksListModel linksList;
  const LinksListViewBlocBuilder({super.key, required this.linksList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLinksListsCubit, GetLinksListsState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => CustomLinkItem(
                    linkItem: linksList.links[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: linksList.links.length),
        );
      },
    );
  }
}
