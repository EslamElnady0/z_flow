import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulsator/pulsator.dart';
import 'package:z_flow/features/settings/presentation/ui%20cubit/dialog%20cubit/dialog_cubit.dart';
import '../../../../core/styles/styles.dart';
import 'bottom_dialog_container.dart';
import 'upper_dialog_container.dart';

class CustomContributerItem extends StatelessWidget {
  final String image;
  final String name;
  const CustomContributerItem(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showFocusedContributer(context, image),
        child: Column(
          children: [
            Expanded(
              child: Pulsator(
                style: const PulseStyle(color: Colors.blue, borderWidth: 100),
                count: 6,
                duration: const Duration(seconds: 10),
                repeat: 0,
                startFromScratch: false,
                autoStart: true,
                fit: PulseFit.contain,
                child: Image.asset(
                  image,
                  height: 200.h,
                  width: 200.w,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              name,
              style: Styles.style26W600.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  void _showFocusedContributer(BuildContext context, String imagePath) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => DialogCubit(),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Center(
                child: Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UpperDialogContainer(image: imagePath, name: name),
                      BottomDialogContainer(
                        image: imagePath,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
