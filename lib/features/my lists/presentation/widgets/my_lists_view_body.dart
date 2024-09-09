import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/add_new_links_list_botom_sheet_body.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/my_lists_list_view_bloc_builder.dart';

import '../../../../core/styles/styles.dart';
import '../view models/get links lists cubit/get_links_lists_cubit.dart';

class MyListsViewBody extends StatefulWidget {
  const MyListsViewBody({super.key});

  @override
  State<MyListsViewBody> createState() => _MyListsViewBodyState();
}

class _MyListsViewBodyState extends State<MyListsViewBody> {
  @override
  void initState() {
    //  getLinksLists(context);

    super.initState();
  }

  @override
  void dispose() {
    if (getIt.isRegistered<GetLinksListsCubit>()) {
      getIt<GetLinksListsCubit>().close();
      getIt.unregister<GetLinksListsCubit>();
    }
    super.dispose();
  }

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
          Text(AppTexts.createCustomLists,
              style: Styles.style14w400, textAlign: TextAlign.center),
          SizedBox(
            height: 12.h,
          ),
          const MyListsListViewBlocBuilder(),
          SizedBox(
            height: 24.h,
          ),
          CustomLightColorsGradientButton(
            text: AppTexts.addNewList,
            icon: Assets.addIcon,
            onTap: () {
              showAddNewLinksListBottomSheet(context);
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

void showAddNewLinksListBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddNewLinksListBotomSheetBody(),
        );
      });
}
