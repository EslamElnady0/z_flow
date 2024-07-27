import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/auth/presentation/views/sign_up_view.dart';
import 'package:z_flow/features/favourites/presentation/views/favourite_habits_view.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/add_habit_view.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/edit_habit_view.dart';
import 'package:z_flow/features/home/presentation/views/tasks%20views/add_task_view.dart';
import 'package:z_flow/features/home/presentation/views/tasks%20views/edit_task_view.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/on_boarding_view.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/favourites/presentation/views/favourite_tasks_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String auth = '/auth';
  static const String logIn = '/logIn';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String addTask = '/addTask';
  static const String addHabit = '/addHabit';
  static const String editHabit = '/editHabit';
  static const String editTask = '/editTask';
  static const String favTasks = '/favTasks';
  static const String favHabits = '/favHabits';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case auth:
        return MaterialPageRoute(builder: (context) => const AuthView());
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogInView(),
        );
      case forgotPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case favTasks:
        return MaterialPageRoute(
            builder: (context) => const FavouriteTasksView());
      case favHabits:
        return MaterialPageRoute(
            builder: (context) => const FavouriteHabitsView());
      case addTask:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<AddTaskCubit>(),
                  child: const AddTaskView(),
                ));
      case editTask:
        TaskModel task = settings.arguments as TaskModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: getIt.get<UpdateTaskCubit>(),
                  child: const EditTaskView(),
                ),
            settings: RouteSettings(arguments: task));
      case addHabit:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<GetTaskCubit>(),
                  child: const AddHabitView(),
                ));
      case editHabit:
        HabitModel habit = settings.arguments as HabitModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: getIt.get<UpdateHabitCubit>(),
                  child: const EditHabitView(),
                ),
            settings: RouteSettings(arguments: habit));
      case home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => BottomNavBarCubit(),
                  child: const HomeView(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const Text("7moksha"));
    }
  }
}
