import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/work%20session%20cubit/work_session_cubit.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/work_session_view_body.dart';

class WorkSessionView extends StatelessWidget {
  const WorkSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: BlocBuilder<WorkSessionCubit, WorkSessionState>(
          builder: (context, state) {
            if (state is WorkSessionInitial) {
              return Text(
                S.of(context).startWorkSession,
                style: Styles.style18w600,
              );
            } else if (state is WorkSessionWorking) {
              return Text(
                S.of(context).workTime,
                style: Styles.style18w600,
              );
            } else {
              return Text(
                S.of(context).breakTime,
                style: Styles.style18w600,
              );
            }
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const WorkSessionViewBody(),
    );
  }
}
