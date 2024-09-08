import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/select_category_helper.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/select%20task%20categories%20cubit/select_task_categories_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_category_checkbox_item.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

class TaskCategoriesListView extends StatelessWidget {
  const TaskCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          itemBuilder: (context, index) =>
              BlocBuilder<SelectTaskCategoriesCubit, SelectTaskCategoriesState>(
                builder: (context, state) {
                  return CustomCategoryCheckboxItem(
                      index: index,
                      value: context
                          .read<SelectTaskCategoriesCubit>()
                          .taskCategories
                          .contains(
                              getIt.get<GetTasksCategoriesCubit>().cats[index]),
                      onChanged: (value) {
                        selecCategoryHelper(value!, context, index);
                      },
                      title: getIt.get<GetTasksCategoriesCubit>().cats[index]);
                },
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 16.h,
              ),
          itemCount: getIt.get<GetTasksCategoriesCubit>().cats.length),
    );
  }
}
