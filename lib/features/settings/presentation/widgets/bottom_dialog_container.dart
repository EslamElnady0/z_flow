import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../../../../core/constants/constants.dart';
import '../ui cubit/dialog cubit/dialog_cubit.dart';
import 'custom_bottom_dialog_action.dart';

class BottomDialogContainer extends StatelessWidget {
  final String image;
  const BottomDialogContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: Constants.drawerGradient,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(12.r)),
      ),
      child: Row(
        children: [
          CustomBottomDialogAction(
              onTap: () {
                Share.share(image == Assets.eslamFlutter
                    ? "https://www.linkedin.com/in/eslam-elnady-58062b25a/"
                    : "https://www.linkedin.com/in/adel-gabr-320752244/");
              },
              text: "Share profile",
              icon: Assets.aboutShareProfileIcon),
          CustomBottomDialogAction(
              onTap: () {
                Clipboard.setData(ClipboardData(
                    text: image == Assets.eslamFlutter
                        ? "https://www.linkedin.com/in/eslam-elnady-58062b25a/"
                        : "https://www.linkedin.com/in/adel-gabr-320752244/"));
                showOverlay(context);
              },
              text: "Copy link",
              icon: Assets.aboutCopyLinkIcon),
          BlocBuilder<DialogCubit, DialogState>(
            builder: (context, state) {
              return CustomBottomDialogAction(
                onTap: () {
                  context.read<DialogCubit>().toggleQrCode();
                },
                text: "QR code",
                icon: Assets.aboutQRCodeIcon,
                color: context.read<DialogCubit>().isQrCodeShwowed
                    ? Colors.white
                    : null,
                gradient: context.read<DialogCubit>().isQrCodeShwowed
                    ? Constants.customButtonGradient
                    : Constants.customItemsGradient,
              );
            },
          ),
        ],
      ),
    );
  }
}

void showOverlay(BuildContext context) {
  // Overlay Entry
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 100.h, // Adjust position from bottom
      left: MediaQuery.of(context).size.width / 2 - 60.w,
      right: MediaQuery.of(context).size.width / 2 - 60.w,
      child: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: Constants.customButtonGradient,
          ),
          child: Center(
            child: Text("Copied!", style: Styles.style18w600),
          ),
        ),
      ),
    ),
  );

  // Insert overlay
  Overlay.of(context).insert(overlayEntry);

  // Remove overlay after 2 seconds
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
