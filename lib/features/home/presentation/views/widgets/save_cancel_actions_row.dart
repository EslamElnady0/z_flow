import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../on boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';

class SaveCancelActionsRow extends StatelessWidget {
  final void Function()? onSavePressed;
  const SaveCancelActionsRow({super.key, this.onSavePressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          onTap: onSavePressed,
          text: AppTexts.save,
          gradient: Constants.customButtonGradient,
          raduis: 16.r,
        )),
        SizedBox(
          width: 50.w,
        ),
        Expanded(
            child: CustomHollowButton(
          text: AppTexts.cancel,
          onTap: Navigator.of(context).pop,
        )),
      ],
    );
  }
}
