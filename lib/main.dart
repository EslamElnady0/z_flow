import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/theme/main_theme.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import 'package:z_flow/features/my%20lists/data/models/link%20item%20model/link_item.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/firebase_options.dart';
import 'core/constants/constants.dart';
import 'core/core cubits/my_bloc_observer.dart';
import 'core/services/local_notifications.dart';
import 'features/home/data/models/habit model/habit_model.dart';
import 'features/home/data/models/task model/task_model.dart';
import 'generated/l10n.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalNotifications.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();

  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(GoalModelAdapter());
  Hive.registerAdapter(EventModelAdapter());
  Hive.registerAdapter(LinkItemAdapter());
  Hive.registerAdapter(LinksListModelAdapter());
  await Hive.openBox<TaskModel>(Constants.tasksBox);
  await Hive.openBox<HabitModel>(Constants.habitsBox);
  await Hive.openBox<GoalModel>(Constants.goalsBox);
  await Hive.openBox<EventModel>(Constants.eventsBox);
  await Hive.openBox<LinksListModel>(Constants.linksBox);
  await Hive.openBox<String>(Constants.categoriesBox);
  await Hive.openBox(Constants.constantsBox);
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
        create: (context) =>
            getIt.get<InternetCheckCubit>()..checkInternetConnection(),
        child: BlocListener<InternetCheckCubit, InternetCheckState>(
          listener: (context, state) {
            if (state is InternetCheckConnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                  buildCustomSnackBar(
                      message: Intl.getCurrentLocale() == "en"
                          ? "All set! You're connected to the internet."
                          : "كل شيء جاهز! أنت متصل بالإنترنت.",
                      isError: false));
            } else if (state is InternetCheckDisconnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                  buildCustomSnackBar(
                      message: Intl.getCurrentLocale() == "en"
                          ? "Oops, it looks like you're offline!"
                          : "عذرًا، يبدو أنك غير متصل بالإنترنت!",
                      isError: true));
            }
          },
          child: MaterialApp(
            locale: Locale('ar'),
            scaffoldMessengerKey: scaffoldMessengerKey,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: MainTheme.mainTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.splash,
          ),
        ),
      ),
    );
  }
}
