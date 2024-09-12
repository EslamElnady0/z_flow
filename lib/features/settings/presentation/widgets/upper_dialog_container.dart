import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/settings/presentation/ui%20cubit/dialog%20cubit/dialog_cubit.dart';
import '../../../../core/constants/constants.dart';
import 'about_dialog_initial_body.dart';
import 'about_dialog_qr_code_body.dart';

class UpperDialogContainer extends StatelessWidget {
  final String image;
  final String name;
  const UpperDialogContainer(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogCubit, DialogState>(
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            decoration: BoxDecoration(
                color: context.read<DialogCubit>().isQrCodeShwowed
                    ? Colors.white
                    : null,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r)),
                gradient: context.read<DialogCubit>().isQrCodeShwowed
                    ? null
                    : Constants.customAboutDialogGradient),
            child: context.read<DialogCubit>().isQrCodeShwowed
                ? AboutDialogQrCodeBody(
                    image: image,
                    name: name,
                  )
                : AboutDialogInitialBody(
                    image: image,
                    name: name,
                  ));
      },
    );
  }
}
