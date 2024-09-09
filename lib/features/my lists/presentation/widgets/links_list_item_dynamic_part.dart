import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';

import 'custom_link_item_row.dart';
import 'custom_manage_list_button.dart';

class LinksListItemDynamicPart extends StatelessWidget {
  final LinksListModel linksList;
  const LinksListItemDynamicPart({super.key, required this.linksList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: Constants.customItemsGradient),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CustomLinkItemRow(
                      title: "dadadadadadas",
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemCount: 3),
              SizedBox(
                height: 16.h,
              ),
              CustomManageListButton(onTap: () {})
            ],
          ),
        )
      ],
    );
  }
}
