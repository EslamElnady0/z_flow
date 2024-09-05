import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

class CustomCalender extends StatelessWidget {
  final void Function(DateTime, DateTime)? onDaySelected;
  final bool Function(DateTime)? selectedDayPredicate;
  final EdgeInsets? margin;
  final DateTime focusedDay;
  const CustomCalender(
      {super.key,
      this.onDaySelected,
      this.selectedDayPredicate,
      required this.focusedDay,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: Constants.customItemsGradient,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [Constants.shadow]),
      child: TableCalendar(
        onDaySelected: onDaySelected,
        rowHeight: 29.h,
        selectedDayPredicate: selectedDayPredicate,
        availableGestures: AvailableGestures.all,
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Styles.style10w600, weekendStyle: Styles.style10w600),
        calendarStyle: CalendarStyle(
            selectedTextStyle: Styles.style10w600.copyWith(color: Colors.white),
            defaultDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
                color: ColorManager.primaryColor, shape: BoxShape.circle),
            tablePadding: EdgeInsets.zero,
            markerDecoration:
                const BoxDecoration(color: ColorManager.primaryColor),
            cellMargin: EdgeInsets.symmetric(vertical: 2.h),
            cellPadding: EdgeInsets.zero,
            defaultTextStyle: Styles.style10w600,
            todayTextStyle: Styles.style10w600.copyWith(color: Colors.white),
            holidayTextStyle: Styles.style10w600,
            disabledTextStyle: Styles.style10w600,
            weekendTextStyle: Styles.style10w600,
            outsideTextStyle: Styles.style10w600,
            outsideDaysVisible: false),
        headerStyle: HeaderStyle(
            headerPadding: EdgeInsets.zero,
            headerMargin: EdgeInsets.only(bottom: 8.h),
            leftChevronVisible: false,
            rightChevronVisible: false,
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: Styles.style24W600.copyWith(color: Colors.black)),
        focusedDay: focusedDay,
        firstDay: DateTime.utc(2012, 1, 1),
        lastDay: DateTime.utc(2036, 12, 31),
      ),
    );
  }
}
