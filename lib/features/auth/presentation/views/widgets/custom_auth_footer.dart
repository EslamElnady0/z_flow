import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/styles/styles.dart';

class CustomAuthFooter extends StatelessWidget {
  final bool backExists;
  final bool skipExists;
  const CustomAuthFooter({
    super.key,
    this.backExists = true,
    this.skipExists = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<LogInCubit>(),
      child: Builder(builder: (context) {
        return Row(
          children: [
            backExists
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 22.r,
                        ),
                        Text(
                          AppTexts.back,
                          style: Styles.style16W600grey.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const Spacer(),
            skipExists
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await context.read<LogInCubit>().signInAnonymous();
                      if (context.mounted) {
                        Navigator.of(context).pushNamed(AppRouter.home);
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          AppTexts.skip,
                          style: Styles.style16W600grey.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 22.r,
                        ),
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        );
      }),
    );
  }
}
