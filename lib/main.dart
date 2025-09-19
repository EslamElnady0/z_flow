import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import 'package:z_flow/features/my%20lists/data/models/link%20item%20model/link_item.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/firebase_options.dart';
import 'package:z_flow/z_flow_app.dart';
import 'core/constants/constants.dart';
import 'core/core cubits/my_bloc_observer.dart';
import 'core/services/local_notifications.dart';
import 'features/home/data/models/habit model/habit_model.dart';
import 'features/home/data/models/task model/task_model.dart';

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
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd
//sdfbhjkfbsbfjhsdfhjsdbfsdgvhjfsdhjkgfsd