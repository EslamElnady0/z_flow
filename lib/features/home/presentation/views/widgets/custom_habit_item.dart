import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/utils/habits%20utils/update_habit.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';
import 'package:z_flow/features/home/presentation/views/widgets/habit_options_menu_body.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';

class CustomHabitItem extends StatefulWidget {
  final GlobalKey actionKey;
  final HabitModel habit;
  const CustomHabitItem({
    super.key,
    required this.actionKey,
    required this.habit,
  });

  @override
  State<CustomHabitItem> createState() => _CustomHabitItemState();
}

class _CustomHabitItemState extends State<CustomHabitItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      BlocBuilder<UpdateHabitCubit, UpdateHabitState>(
        builder: (context, state) {
          return CustomCheckBox(
            value: widget.habit.isDone,
            onChanged: (value) async {
              widget.habit.isDone = !(widget.habit.isDone);
              await updateHabit(habit: widget.habit);
            },
          );
        },
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 12.w),
          alignment: Alignment.centerLeft,
          height: 50.h,
          decoration: BoxDecoration(
              gradient: Constants.customItemsGradient,
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 220.w,
                child: Text(
                  widget.habit.title,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16W600grey.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              IconButton(
                key: widget.actionKey,
                onPressed: () {
                  BuildOverlayMenu.showOverlay(context, widget.actionKey,
                      widget: HabitOptionsMenuBody(habit: widget.habit));
                },
                icon: Icon(Icons.more_vert, color: Colors.black, size: 20.r),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
