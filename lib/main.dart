import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/theme/main_theme.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'package:z_flow/firebase_options.dart';
import 'core/constants/constants.dart';
import 'features/home/data/models/habit model/habit_model.dart';
import 'features/home/data/models/task model/task_model.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(HabitModelAdapter());
  await Hive.openBox<TaskModel>(Constants.tasksBox);
  await Hive.openBox<HabitModel>(Constants.habitsBox);
  runApp(const ZFlowApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ZFlowApp extends StatelessWidget {
  const ZFlowApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => InternetCheckCubit()..checkInternetConnection(),
        child: BlocListener<InternetCheckCubit, InternetCheckState>(
          listener: (context, state) {
            if (state is InternetCheckConnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                  buildCustomSnackBar(message: "Connected to internet"));
            } else if (state is InternetCheckDisconnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                  buildCustomSnackBar(
                      message: "Disconnected from internet",
                      backgroundColor: ColorManager.red));
            }
          },
          child: MaterialApp(
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: MainTheme.mainTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.auth,
          ),
        ),
      ),
    );
  }
}
