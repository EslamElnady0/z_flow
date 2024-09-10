import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/links_list_view_bloc_builder.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import 'add_new_link_bottom_sheet_body.dart';

class ListDetailsViewBody extends StatelessWidget {
  final LinksListModel linksList;
  const ListDetailsViewBody({
    super.key,
    required this.linksList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(AppTexts.youCanManageTheList,
              style: Styles.style14w400, textAlign: TextAlign.center),
          SizedBox(
            height: 16.h,
          ),
          LinksListViewBlocBuilder(
            linksList: linksList,
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomLightColorsGradientButton(
            text: AppTexts.addNewLink,
            icon: Assets.addIcon,
            onTap: () {
              showAddNewLinkBottomSheet(
                context,
                linksList,
              );
            },
          ),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}

void showAddNewLinkBottomSheet(BuildContext context, LinksListModel linksList,
    [int? index]) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddNewLinkBottomSheetBody(
            linksListModel: linksList,
            index: index,
          ),
        );
      });
}
