import 'package:flutter/material.dart';
import 'package:z_flow/generated/l10n.dart';

String getDurationText(
    {required Duration? duration, required BuildContext context}) {
  switch (duration?.inHours) {
    case const (24):
      return S.of(context).finishedTasksLastDay;
    case const (24 * 7):
      return S.of(context).finishedTasksLast7Days;
    case const (24 * 28):
      return S.of(context).finishedTasksLast28Days;
    case null:
      return S.of(context).allFinishedTasks;

    default:
      return S.of(context).allFinishedTasks;
  }
}
