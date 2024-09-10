import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/reinitialize_cubits_if_needed.dart';
import 'package:z_flow/features/auth/presentation/view%20models/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20ano%20cubit/log_in_ano_cubit.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';
import 'package:z_flow/features/auth/presentation/views/sign_up_view.dart';
import 'package:z_flow/features/favourites/presentation/views/favourite_habits_view.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';
import 'package:z_flow/features/goals/presentation/views/goals_view.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/bottom%20nav%20bar%20cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/add%20habit%20cubit/add_habits_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/habits/update%20habit%20cubit/update_habit_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/tasks/update%20task%20cubit/update_task_cubit.dart';
import 'package:z_flow/features/home/presentation/view%20models/time%20management/time%20of%20use%20cubit/time_of_use_cubit.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/add_habit_view.dart';
import 'package:z_flow/features/home/presentation/views/habits%20views/edit_habit_view.dart';
import 'package:z_flow/features/home/presentation/views/tasks%20views/add_task_view.dart';
import 'package:z_flow/features/home/presentation/views/tasks%20views/edit_task_view.dart';
import 'package:z_flow/features/home/presentation/views/tasks%20views/finished_tasks_view.dart';
import 'package:z_flow/features/home/presentation/views/time%20management%20views/time_of_use_view.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/get%20links%20lists%20cubit/get_links_lists_cubit.dart';
import 'package:z_flow/features/my%20lists/presentation/views/my_lists_view.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/on_boarding_view.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/add%20event%20cubit/add_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/update%20event%20cubit/update_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/views/add_reminder_view.dart';
import 'package:z_flow/features/reminder/presentation/views/reminder_view.dart';
import 'package:z_flow/features/search/search%20cubit/search_cubit.dart';
import 'package:z_flow/features/search/views/search_view.dart';
import 'package:z_flow/features/stay%20away/presentation/views/stay_away_view.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/add%20tasks%20category%20cubit/add_tasks_category_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/delete%20task%20category%20cubit/delete_task_category_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/get%20tasks%20categories%20cubit/get_tasks_categories_cubit.dart';
import 'package:z_flow/features/tasks%20cats/presentation/views/add_category_view.dart';
import 'package:z_flow/features/tasks%20cats/presentation/views/edit_category_list_view.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/timer%20cubit/timer_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/views/work_session_view.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/favourites/data/view models/favourite habits cubit/favourite_habits_cubit.dart';
import '../../features/favourites/data/view models/favourite tasks cubit/favourite_tasks_cubit.dart';
import '../../features/favourites/presentation/views/favourite_tasks_view.dart';
import '../../features/goals/data/model/goal_model.dart';
import '../../features/goals/presentation/view models/add goal cubit/add_goal_cubit.dart';
import '../../features/goals/presentation/view models/delete goal cubit/delete_goal_cubit.dart';
import '../../features/goals/presentation/view models/edit goal cubit/edit_goal_cubit.dart';
import '../../features/goals/presentation/views/add_goal_view.dart';
import '../../features/goals/presentation/views/edit_goal_view.dart';
import '../../features/home/presentation/view models/habits/delete habit cubit/delete_habit_cubit.dart';
import '../../features/home/presentation/view models/habits/get habits cubit/get_habit_cubit.dart';
import '../../features/home/presentation/view models/tasks/delete task cubit/delete_task_cubit.dart';
import '../../features/home/presentation/views/habits views/all_habits_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/my lists/presentation/views/list_details_view.dart';
import '../../features/reminder/presentation/view models/delete event cubit/delete_event_cubit.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/stay away/presentation/cubit/stay_away_cubit.dart';
import '../../features/tasks cats/presentation/views/tasks_categories_view.dart';
import '../../features/work session/presentation/ui cubits/work session cubit/work_session_cubit.dart';
import '../core cubits/internet check cubit/internet_check_cubit.dart';

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
  static const String timeOfUse = '/timeOfUse';
  static const String stayAway = '/stayAway';
  static const String workSession = '/workSession';
  static const String search = '/search';
  static const String tasksFinished = '/tasksFinished';
  static const String allHabits = '/allHabits';
  static const String taskCats = '/taskCats';
  static const String addNewCat = '/addNewCat';
  static const String editCatList = '/editCatList';
  static const String goals = '/goals';
  static const String addGoal = '/addGoal';
  static const String editGoal = '/editGoal';
  static const String reminder = '/reminder';
  static const String addReminder = '/addReminder';
  static const String myLists = '/myLists';
  static const String listDetails = '/listDetails';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case auth:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<LogInCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<LogInAnoCubit>(),
                    ),
                  ],
                  child: const AuthView(),
                ));
      case logIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LogInAnoCubit>(),
            child: const LogInView(),
          ),
        );
      case forgotPassword:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ForgetPasswordCubit>(),
                  child: const ForgotPasswordView(),
                ));
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case favTasks:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt.get<FavouriteTasksCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<UpdateTaskCubit>(),
                    ),
                  ],
                  child: const FavouriteTasksView(),
                ));
      case favHabits:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<FavouriteHabitsCubit>(),
                  child: const FavouriteHabitsView(),
                ));
      case addTask:
        reinitializeGetCategoriesCubitIfNeeded();
        var args = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<AddTaskCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt.get<GetTasksCategoriesCubit>(),
                    ),
                  ],
                  child: const AddTaskView(),
                ),
            settings: RouteSettings(arguments: args));
      case editTask:
        reinitializeGetCategoriesCubitIfNeeded();

        TaskModel task = settings.arguments as TaskModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<UpdateTaskCubit>(),
                  child: const EditTaskView(),
                ),
            settings: RouteSettings(arguments: task));
      case addHabit:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<AddHabitCubit>(),
                  child: const AddHabitView(),
                ));
      case editHabit:
        HabitModel habit = settings.arguments as HabitModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<UpdateHabitCubit>(),
                  child: const EditHabitView(),
                ),
            settings: RouteSettings(arguments: habit));
      case home:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => BottomNavBarCubit(),
                    ),
                    BlocProvider.value(
                      value: getIt.get<GetTaskCubit>(),
                    ),
                    BlocProvider.value(
                      value: getIt.get<GetHabitCubit>(),
                    ),
                  ],
                  child: const HomeView(),
                ));
      case timeOfUse:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TimeOfUseCubit(),
                  child: const TimeOfUseView(),
                ));
      case stayAway:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => StayAwayCubit(),
                  child: const StayAwayView(),
                ));
      case search:
        var args = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: const SearchView(),
                ),
            settings: RouteSettings(arguments: args));
      case goals:
        reinitializeGetGoalsCubitIfNeeded();
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<GetGoalsCubit>()
                    ..getGoals(
                        isConnected:
                            getIt.get<InternetCheckCubit>().isDeviceConnected,
                        isAnonymous:
                            getIt.get<FirebaseAuth>().currentUser!.isAnonymous),
                  child: const GoalsView(),
                ));
      case addGoal:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<AddGoalCubit>(),
                  child: const AddGoalView(),
                ));
      case editGoal:
        GoalModel goal = settings.arguments as GoalModel;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<EditGoalCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<DeleteGoalCubit>(),
                    ),
                  ],
                  child: const EditGoalView(),
                ),
            settings: RouteSettings(arguments: goal));
      case workSession:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<TimerCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<WorkSessionCubit>(),
                    ),
                  ],
                  child: const WorkSessionView(),
                ));
      case tasksFinished:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: getIt.get<GetTaskCubit>()..getRecentTasksFilter(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<DeleteTaskCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<UpdateTaskCubit>(),
                    ),
                  ],
                  child: const FinishedTasksView(),
                ));
      case allHabits:
        var isDoneHabits = settings.arguments as bool;
        return MaterialPageRoute(
          settings: RouteSettings(arguments: isDoneHabits),
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt.get<GetHabitCubit>()
                  ..getRecentOnGoingHabitsFilter()
                  ..getRecentDoneHabitsFilter(
                      getIt.get<GetHabitCubit>().duration),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteHabitCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpdateHabitCubit>(),
              ),
            ],
            child: const AllHabitsView(),
          ),
        );
      case taskCats:
        reinitializeGetCategoriesCubitIfNeeded();
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<GetTasksCategoriesCubit>()
                    ..getTasksCategories(
                        isConnected:
                            getIt<InternetCheckCubit>().isDeviceConnected,
                        isAnonymous:
                            getIt<FirebaseAuth>().currentUser!.isAnonymous),
                  child: const TasksCategoriesView(),
                ));
      case addNewCat:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<AddTasksCategoryCubit>(),
                    ),
                    BlocProvider.value(
                      value: getIt<GetTasksCategoriesCubit>(),
                    ),
                  ],
                  child: const AddCategoryView(),
                ));
      case editCatList:
        var category = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: getIt.get<GetTaskCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<DeleteTaskCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<UpdateTaskCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<DeleteTaskCategoryCubit>(),
                    )
                  ],
                  child: const EditCategoryListView(),
                ),
            settings: RouteSettings(arguments: category));
      case reminder:
        reinitializeGetEventsCubitIfNeeded();
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => getIt.get<GetEventsCubit>()),
                    BlocProvider(
                      create: (context) => getIt<DeleteEventCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<UpdateEventCubit>(),
                    ),
                  ],
                  child: const ReminderView(),
                ));
      case addReminder:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<AddEventCubit>(),
                  child: const AddReminderView(),
                ));
      case myLists:
        reinitializeGetLinksListsCubitIfNeeded();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<GetLinksListsCubit>()
              ..getLinksLists(
                isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
                isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous,
              ),
            child: const MyListsView(),
          ),
        );
      case listDetails:
        var args = settings.arguments as LinksListModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: getIt.get<GetLinksListsCubit>(),
                  child: const ListDetailsView(),
                ),
            settings: RouteSettings(arguments: args));
      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("7moksha")));
    }
  }
}
