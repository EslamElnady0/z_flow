import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/core/core%20cubits/localization%20cubit/localization_cubit.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/theme/main_theme.dart';
import 'package:z_flow/core/utils/helper%20enums/language_enum.dart';
import 'package:z_flow/core/widgets/build_custom_snack_bar.dart';
import 'generated/l10n.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ZFlowApp extends StatelessWidget {
  const ZFlowApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt.get<InternetCheckCubit>()..checkInternetConnection(),
          ),
          BlocProvider(
            create: (context) =>
                LocalizationCubit()
                  ..changeAppLanguage(LanguageEnum.initialLang),
          ),
        ],
        child: BlocListener<InternetCheckCubit, InternetCheckState>(
          listener: (context, state) {
            if (state is InternetCheckConnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                buildCustomSnackBar(
                  message: Intl.getCurrentLocale() == "en"
                      ? "All set! You're connected to the internet."
                      : "كل شيء جاهز! أنت متصل بالإنترنت.",
                  isError: false,
                ),
              );
            } else if (state is InternetCheckDisconnected) {
              scaffoldMessengerKey.currentState?.showSnackBar(
                buildCustomSnackBar(
                  message: Intl.getCurrentLocale() == "en"
                      ? "Oops, it looks like you're offline!"
                      : "عذرًا، يبدو أنك غير متصل بالإنترنت!",
                  isError: true,
                ),
              );
            }
          },
          child: BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              if (state is LocalizationChanged) {
                return MaterialApp(
                  locale: Locale(state.languageCode ?? "en"),
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
                );
              } else {
                return MaterialApp(
                  scaffoldMessengerKey: scaffoldMessengerKey,
                  locale: const Locale("en"),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale("en"), Locale("ar")],
                  theme: MainTheme.mainTheme,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                  initialRoute: AppRouter.splash,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
//dfbnsdfbnsdfbnsdfmnsdfmnhsdfmn