import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../on boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';

class BottomScreenActions extends StatelessWidget {
  final void Function()? onPrimaryButtonPressed;
  final void Function() onOtherButtonPressed;
  final String otherButtonText;
  final String? primaryButtonText;
  const BottomScreenActions(
      {super.key,
      this.onPrimaryButtonPressed,
      required this.onOtherButtonPressed,
      required this.otherButtonText,
      this.primaryButtonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          onTap: onPrimaryButtonPressed,
          text: primaryButtonText ?? S.of(context).save,
          gradient: Constants.customButtonGradient,
          raduis: 16.r,
        )),
        SizedBox(
          width: 50.w,
        ),
        Expanded(
            child: CustomHollowButton(
          text: otherButtonText,
          color: ColorManager.primaryColorAccent,
          onTap: onOtherButtonPressed,
        )),
      ],
    );
  }
}
