import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import '../widgets/custom_task_item.dart';

class ExistingTasksBody extends StatelessWidget {
  final BuildContext ctx;
  const ExistingTasksBody({
    super.key,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            S.of(context).onGoingTasks,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                GlobalKey actionKey = GlobalKey();
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    child: CustomTaskItem(
                      task: ctx.read<GetTaskCubit>().onGoingTasks[index],
                      actionKey: actionKey,
                    ));
              },
              itemCount: ctx.read<GetTaskCubit>().onGoingTasks.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
