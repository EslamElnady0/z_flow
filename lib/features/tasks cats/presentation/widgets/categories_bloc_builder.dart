import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import 'custom_task_category_item.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCategoriesCubit, GetTasksCategoriesState>(
      builder: (context, state) {
        if (state is GetTasksCategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetTasksCategoriesSuccess) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return TaskCategoryItem(
                          index: index,
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.editCatList, arguments: {
                              "title": state.cats[index],
                              "index": index
                            });
                          },
                          title: state.cats[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    },
                    itemCount: state.cats.length,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomLightColorsGradientButton(
                    text: AppTexts.addNewCategory,
                    icon: Assets.addIcon,
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.addNewCat);
                    }),
                SizedBox(
                  height: 48.h,
                )
              ],
            ),
          );
        } else {
          return const Center(child: Text("error"));
        }
      },
    );
  }
}
