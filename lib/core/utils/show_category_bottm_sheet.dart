import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_category_checkbox_item.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';

void showCategoryBottomSheet(
    {required BuildContext context,
    required TextEditingController controller,
    required List<String> taskCategories}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: Constants.drawerGradient,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                    itemBuilder: (context, index) => CustomCategoryCheckboxItem(
                        index: index,
                        onTap: () {},
                        title:
                            getIt.get<GetTasksCategoriesCubit>().cats[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 16.h,
                        ),
                    itemCount:
                        getIt.get<GetTasksCategoriesCubit>().cats.length),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomLightColorsGradientButton(
                text: AppTexts.addNewCategory,
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                icon: Assets.addIcon,
                onTap: () {},
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        );
      });
}
