import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/add_links_list.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/get_links_lists.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/add%20links%20list%20cubit/add_links_list_cubit.dart';

import '../../../../core/DI/service_locator.dart';
import '../../../../core/constants/app_texts.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../../../auth/presentation/views/widgets/custom_auth_textfield.dart';
import '../../../home/presentation/views/widgets/save_cancel_actions_row.dart';

class AddNewLinksListBotomSheetBody extends StatefulWidget {
  const AddNewLinksListBotomSheetBody({
    super.key,
  });

  @override
  State<AddNewLinksListBotomSheetBody> createState() =>
      _AddNewLinksListBotomSheetBodyState();
}

class _AddNewLinksListBotomSheetBodyState
    extends State<AddNewLinksListBotomSheetBody> {
  late TextEditingController titleController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddLinksListCubit>(),
      child: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
              gradient: Constants.drawerGradient,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.close))),
                        Text(
                          AppTexts.addNewList,
                          style:
                              Styles.style18w500.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Divider(
                      height: 25.h,
                    ),
                    Text(AppTexts.easilyAddANewList, style: Styles.style14w400),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomAuthTextField(
                        hintText: AppTexts.title,
                        suffix: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: SvgPicture.asset(
                            Assets.list,
                            height: 16.h,
                            width: 16.w,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        icon: null,
                        controller: titleController),
                    SizedBox(
                      height: 25.h,
                    ),
                    BottomScreenActions(
                        onOtherButtonPressed: () {
                          Navigator.of(context).pop();
                        },
                        otherButtonText: AppTexts.cancel,
                        onPrimaryButtonPressed: () async {
                          if (formKey.currentState!.validate()) {
                            LinksListModel linksList = LinksListModel(
                              name: titleController.text.trim(),
                            );
                            Navigator.pop(context);
                            await addLinksList(
                                linksList: linksList, context: context);
                            if (context.mounted) {
                              getLinksLists();
                            }
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
