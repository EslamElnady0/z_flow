import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/select%20task%20categories%20cubit/select_task_categories_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/add%20tasks%20category%20cubit/add_tasks_category_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/tasks utils/categories/add_task_categories.dart';
import '../../../../auth/presentation/views/widgets/custom_auth_textfield.dart';

class BottomSheetAddCategoryBody extends StatefulWidget {
  const BottomSheetAddCategoryBody({super.key});

  @override
  State<BottomSheetAddCategoryBody> createState() =>
      _BottomSheetAddCategoryBodyState();
}

class _BottomSheetAddCategoryBodyState
    extends State<BottomSheetAddCategoryBody> {
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
      create: (context) => getIt<AddTasksCategoryCubit>(),
      child: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
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
                              context
                                  .read<SelectTaskCategoriesCubit>()
                                  .popFromAddCategory();
                            },
                            child: const Icon(Icons.close))),
                    Text(
                      AppTexts.addNewCategory,
                      style: Styles.style18w500.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Divider(
                  height: 25.h,
                ),
                Text(AppTexts.addNewCategoryToList, style: Styles.style14w400),
                SizedBox(
                  height: 20.h,
                ),
                CustomAuthTextField(
                    hintText: AppTexts.title,
                    suffix: Padding(
                      padding: EdgeInsets.all(16.r),
                      child: SvgPicture.asset(
                        Assets.tasksIcon,
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
                    onSavePressed: () {
                      if (formKey.currentState!.validate()) {
                        addTaskCategory(
                            category: titleController.text, context: context);
                        getIt
                            .get<GetTasksCategoriesCubit>()
                            .cats
                            .add(titleController.text);
                        context
                            .read<SelectTaskCategoriesCubit>()
                            .popFromAddCategory();
                      }
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
