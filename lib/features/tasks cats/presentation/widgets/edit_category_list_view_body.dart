import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/utils/tasks%20utils/categories/delete_task_category.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import 'categorized_tasks_body.dart';
import 'custom_task_category_item.dart';

class EditCategoryListViewBody extends StatefulWidget {
  final String category;
  final int index;
  const EditCategoryListViewBody(
      {super.key, required this.category, required this.index});

  @override
  State<EditCategoryListViewBody> createState() =>
      _EditCategoryListViewBodyState();
}

class _EditCategoryListViewBodyState extends State<EditCategoryListViewBody> {
  @override
  void initState() {
    getIt.get<GetTaskCubit>().getCategorizedTasks(widget.category);
    super.initState();
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
          Text(S.of(context).easilyManageYourCategorizedTasks,
              style: Styles.style14w400),
          SizedBox(
            height: 12.h,
          ),
          TaskCategoryItem(
            index: widget.index,
            onTap: () {
              Navigator.pop(context);
            },
            title: widget.category,
            isEdit: true,
          ),
          SizedBox(
            height: 12.h,
          ),
          CategorizedTasksBody(category: widget.category),
          SizedBox(
            height: 20.h,
          ),
          CustomLightColorsGradientButton(
              text: S.of(context).addTaskToCategoryList,
              icon: Assets.addIcon,
              onTap: () {
                Navigator.pushNamed(context, AppRouter.addTask,
                    arguments: widget.category);
              }),
          SizedBox(
            height: 24.h,
          ),
          BottomScreenActions(
              onOtherButtonPressed: () {
                deleteTaskCategory(category: widget.category, context: context);
                Navigator.pop(context);
              },
              onPrimaryButtonPressed: () {
                Navigator.pop(context);
              },
              otherButtonText: S.of(context).delete),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
