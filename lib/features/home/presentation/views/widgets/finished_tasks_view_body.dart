import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../../core/constants/assets.dart';
import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import 'custom_task_item.dart';

class FinishedTasksViewBody extends StatelessWidget {
  const FinishedTasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.filter,
                style: Styles.style20W600.copyWith(color: Colors.white),
              ),
              SvgPicture.asset(
                Assets.settingsIcon,
                height: 16.h,
                width: 16.w,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    GlobalKey actionKey = GlobalKey();
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 10.w),
                        child: CustomTaskItem(
                          task: context.read<GetTaskCubit>().doneTasks[index],
                          actionKey: actionKey,
                        ));
                  },
                  itemCount: context.read<GetTaskCubit>().doneTasks.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
