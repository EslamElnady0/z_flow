import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';

String getDurationTextHabits(
    {required Duration? duration,
    required bool isDoneHabits,
    required BuildContext context}) {
  switch (duration?.inHours) {
    case const (24):
      return isDoneHabits
          ? S.of(context).doneHabitsLastDay
          : S.of(context).ongoingHabitsLastDay;
    case const (24 * 7):
      return isDoneHabits
          ? S.of(context).doneHabits7Days
          : S.of(context).ongoingHabitsLast7Days;
    case const (24 * 28):
      return isDoneHabits
          ? S.of(context).doneHabits28Days
          : S.of(context).ongoingHabitsLast28Days;
    case null:
      return isDoneHabits
          ? S.of(context).allDoneHabits
          : S.of(context).allOngoingHabits;

    default:
      return isDoneHabits
          ? S.of(context).allDoneHabits
          : S.of(context).allOngoingHabits;
  }
}
