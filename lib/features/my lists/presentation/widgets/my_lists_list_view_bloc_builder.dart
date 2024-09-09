import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/get%20links%20lists%20cubit/get_links_lists_cubit.dart';

import 'custom_links_list_item.dart';

class MyListsListViewBlocBuilder extends StatelessWidget {
  const MyListsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLinksListsCubit, GetLinksListsState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomLinksListItem(
                  index: index,
                  linksListModel:
                      getIt.get<GetLinksListsCubit>().linksLists[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: getIt.get<GetLinksListsCubit>().linksLists.length),
        );
      },
    );
  }
}
