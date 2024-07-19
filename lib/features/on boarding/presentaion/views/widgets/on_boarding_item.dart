import 'package:flutter/material.dart';

import '../../../data/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnBoardingItem({
    super.key,
    required this.onboardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset(onboardingModel.image)),
      ],
    );
  }
}


//  Positioned(
//           right: 0,
//           left: 0,
//           top: 330.h,
//           child: Column(
//             children: [
//               Text(
//                 onboardingModel.text,
//                 style: TextStyle(color: Colors.white, fontSize: 20.sp),
//               ),
//               Text(onboardingModel.desc,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 14.sp)),
//             ],
//           ),
//         )