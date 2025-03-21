import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import '../../../../generated/l10n.dart';
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
              SizedBox(
                height: 10.h,
              ),
              linksList.links.isEmpty
                  ? Text(
                      S.of(context).noLinksYet,
                      style:
                          Styles.style16W600grey.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomLinkItemRow(
                          title: linksList.links[index].name,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemCount: linksList.links.length),
              SizedBox(
                height: 16.h,
              ),
              CustomManageListButton(onTap: () {
                Navigator.pushNamed(context, AppRouter.listDetails,
                    arguments: linksList);
              })
            ],
          ),
        )
      ],
    );
  }
}
