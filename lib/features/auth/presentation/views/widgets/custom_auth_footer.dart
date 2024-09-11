import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20ano%20cubit/log_in_ano_cubit.dart';
import 'package:z_flow/generated/l10n.dart';
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
                      S.of(context).back,
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
                  await context.read<LogInAnoCubit>().signInAnonymous();
                  if (context.mounted) {
                    Navigator.of(context).pushNamed(AppRouter.home);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).skip,
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
  }
}
