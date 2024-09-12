import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../ui cubit/dialog cubit/dialog_cubit.dart';

class AboutDialogQrCodeBody extends StatelessWidget {
  final String image;
  final String name;
  const AboutDialogQrCodeBody(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: GestureDetector(
                    onTap: () {
                      context.read<DialogCubit>().toggleQrCode();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.r,
                    ))),
            Text(
              "QR code",
              style: Styles.style18w500.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.h,
          color: Colors.black,
        ),
        SizedBox(
          height: 16.h,
        ),
        QrImageView(
          data: image == Assets.eslamFlutter
              ? "https://www.linkedin.com/in/eslam-elnady-58062b25a/"
              : "https://www.linkedin.com/in/adel-gabr-320752244/",
          version: QrVersions.auto,
          size: 248.r,
        ),
      ],
    );
  }
}
