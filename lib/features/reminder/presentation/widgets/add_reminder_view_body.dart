import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import 'package:z_flow/features/reminder/presentation/widgets/event_data_form.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';

class AddReminderViewBody extends StatefulWidget {
  const AddReminderViewBody({super.key});

  @override
  State<AddReminderViewBody> createState() => _AddReminderViewBodyState();
}

class _AddReminderViewBodyState extends State<AddReminderViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController eventTitle;
  late TextEditingController eventStart;
  late TextEditingController eventEnd;
  late TextEditingController eventNote;
  @override
  void initState() {
    eventTitle = TextEditingController();
    eventStart = TextEditingController();
    eventEnd = TextEditingController();
    eventNote = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    eventTitle.dispose();
    eventStart.dispose();
    eventEnd.dispose();
    eventNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppTexts.helpYouStayOrganized,
                    style: Styles.style14w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EventDataForm(
                      formKey: formKey,
                      eventTitle: eventTitle,
                      eventStart: eventStart,
                      eventEnd: eventEnd,
                      eventNote: eventNote)
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  BottomScreenActions(
                    onSavePressed: () {},
                    onOtherButtonPressed: () => Navigator.pop(context),
                    otherButtonText: AppTexts.cancel,
                  ),
                  SizedBox(
                    height: 48.h,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
