import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../../core/styles/styles.dart';
import 'categories_bloc_builder.dart';

class TasksCategoriesViewBody extends StatefulWidget {
  const TasksCategoriesViewBody({super.key});

  @override
  State<TasksCategoriesViewBody> createState() =>
      _TasksCategoriesViewBodyState();
}

class _TasksCategoriesViewBodyState extends State<TasksCategoriesViewBody> {
  @override
  void dispose() {
    if (getIt.isRegistered<GetTasksCategoriesCubit>()) {
      getIt<GetTasksCategoriesCubit>().close();
      getIt.unregister<GetTasksCategoriesCubit>();
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
          Text(
            AppTexts.exploreYourTasksCategorize,
            style: Styles.style14w400,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24.h,
          ),
          const CategoriesBlocBuilder()
        ],
      ),
    );
  }
}
