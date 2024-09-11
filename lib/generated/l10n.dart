// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mental Health`
  String get mentalHealth {
    return Intl.message(
      'Mental Health',
      name: 'mentalHealth',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Lock`
  String get lock {
    return Intl.message(
      'Lock',
      name: 'lock',
      desc: '',
      args: [],
    );
  }

  /// `Control the application settings easily from here!`
  String get controlAppSettings {
    return Intl.message(
      'Control the application settings easily from here!',
      name: 'controlAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `You can manage the list from here and add new links!`
  String get youCanManageTheList {
    return Intl.message(
      'You can manage the list from here and add new links!',
      name: 'youCanManageTheList',
      desc: '',
      args: [],
    );
  }

  /// `Title..`
  String get title {
    return Intl.message(
      'Title..',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Fitness`
  String get fitness {
    return Intl.message(
      'Fitness',
      name: 'fitness',
      desc: '',
      args: [],
    );
  }

  /// `Sent password reset email to `
  String get sentPasswordResetEmail {
    return Intl.message(
      'Sent password reset email to ',
      name: 'sentPasswordResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message(
      'Finance',
      name: 'finance',
      desc: '',
      args: [],
    );
  }

  /// `You didn't add any links here yet :(`
  String get noLinksYet {
    return Intl.message(
      'You didn\'t add any links here yet :(',
      name: 'noLinksYet',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message(
      'Manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `Easily add a new list!`
  String get easilyAddANewList {
    return Intl.message(
      'Easily add a new list!',
      name: 'easilyAddANewList',
      desc: '',
      args: [],
    );
  }

  /// `Easily add a new link!`
  String get easilyAddANewLink {
    return Intl.message(
      'Easily add a new link!',
      name: 'easilyAddANewLink',
      desc: '',
      args: [],
    );
  }

  /// `Description..`
  String get description {
    return Intl.message(
      'Description..',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add a new link`
  String get addNewLink {
    return Intl.message(
      'Add a new link',
      name: 'addNewLink',
      desc: '',
      args: [],
    );
  }

  /// `Add a new list`
  String get addNewList {
    return Intl.message(
      'Add a new list',
      name: 'addNewList',
      desc: '',
      args: [],
    );
  }

  /// `Create custom lists to organize your favorite resources!`
  String get createCustomLists {
    return Intl.message(
      'Create custom lists to organize your favorite resources!',
      name: 'createCustomLists',
      desc: '',
      args: [],
    );
  }

  /// `Personal development`
  String get personalDevelopment {
    return Intl.message(
      'Personal development',
      name: 'personalDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Education and courses`
  String get educationAndCourses {
    return Intl.message(
      'Education and courses',
      name: 'educationAndCourses',
      desc: '',
      args: [],
    );
  }

  /// `Productivity tools`
  String get productivityTools {
    return Intl.message(
      'Productivity tools',
      name: 'productivityTools',
      desc: '',
      args: [],
    );
  }

  /// `Read later`
  String get readLater {
    return Intl.message(
      'Read later',
      name: 'readLater',
      desc: '',
      args: [],
    );
  }

  /// `Select a category`
  String get selectCategory {
    return Intl.message(
      'Select a category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Your Task Deadline is Coming!`
  String get yourTaskDeadLineIsComing {
    return Intl.message(
      'Your Task Deadline is Coming!',
      name: 'yourTaskDeadLineIsComing',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `You will get notified about this at `
  String get youWillGetNotifiedAboutThisAt {
    return Intl.message(
      'You will get notified about this at ',
      name: 'youWillGetNotifiedAboutThisAt',
      desc: '',
      args: [],
    );
  }

  /// `Keep Working Hard To Achieve Your Goals :)`
  String get keepWorkingHard {
    return Intl.message(
      'Keep Working Hard To Achieve Your Goals :)',
      name: 'keepWorkingHard',
      desc: '',
      args: [],
    );
  }

  /// `You Have Habit Todo`
  String get habitsTodo {
    return Intl.message(
      'You Have Habit Todo',
      name: 'habitsTodo',
      desc: '',
      args: [],
    );
  }

  /// `Add a new category`
  String get addNewCategory {
    return Intl.message(
      'Add a new category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Task classifications`
  String get taskClassifications {
    return Intl.message(
      'Task classifications',
      name: 'taskClassifications',
      desc: '',
      args: [],
    );
  }

  /// `Explore your tasks easily - Categorize tasks with just one tap!`
  String get exploreYourTasksCategorize {
    return Intl.message(
      'Explore your tasks easily - Categorize tasks with just one tap!',
      name: 'exploreYourTasksCategorize',
      desc: '',
      args: [],
    );
  }

  /// `Add a task to the list`
  String get addTaskToCategoryList {
    return Intl.message(
      'Add a task to the list',
      name: 'addTaskToCategoryList',
      desc: '',
      args: [],
    );
  }

  /// `Edit the Category List`
  String get editCategoryList {
    return Intl.message(
      'Edit the Category List',
      name: 'editCategoryList',
      desc: '',
      args: [],
    );
  }

  /// `Easily add a new category to your tasks`
  String get addNewCategoryToList {
    return Intl.message(
      'Easily add a new category to your tasks',
      name: 'addNewCategoryToList',
      desc: '',
      args: [],
    );
  }

  /// `Easily manage your categorized tasks`
  String get easilyManageYourCategorizedTasks {
    return Intl.message(
      'Easily manage your categorized tasks',
      name: 'easilyManageYourCategorizedTasks',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Add a new event`
  String get addANewEvent {
    return Intl.message(
      'Add a new event',
      name: 'addANewEvent',
      desc: '',
      args: [],
    );
  }

  /// `Your events are coming!`
  String get yourEventsAreComing {
    return Intl.message(
      'Your events are coming!',
      name: 'yourEventsAreComing',
      desc: '',
      args: [],
    );
  }

  /// `events already passed!`
  String get eventsAlreadyPassed {
    return Intl.message(
      'events already passed!',
      name: 'eventsAlreadyPassed',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Goal..`
  String get writeYourGoal {
    return Intl.message(
      'Write Your Goal..',
      name: 'writeYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Habits`
  String get onGoingHabits {
    return Intl.message(
      'Ongoing Habits',
      name: 'onGoingHabits',
      desc: '',
      args: [],
    );
  }

  /// `Done Habits`
  String get doneHabits {
    return Intl.message(
      'Done Habits',
      name: 'doneHabits',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calender {
    return Intl.message(
      'Calendar',
      name: 'calender',
      desc: '',
      args: [],
    );
  }

  /// `Big Event awaits you`
  String get bigEventAwaitsYou {
    return Intl.message(
      'Big Event awaits you',
      name: 'bigEventAwaitsYou',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Time..`
  String get timeHint {
    return Intl.message(
      'Time..',
      name: 'timeHint',
      desc: '',
      args: [],
    );
  }

  /// `Habits`
  String get habits {
    return Intl.message(
      'Habits',
      name: 'habits',
      desc: '',
      args: [],
    );
  }

  /// `All Finished Tasks`
  String get allFinishedTasks {
    return Intl.message(
      'All Finished Tasks',
      name: 'allFinishedTasks',
      desc: '',
      args: [],
    );
  }

  /// `Organize Your Tasks`
  String get firstOnBoarding {
    return Intl.message(
      'Organize Your Tasks',
      name: 'firstOnBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Manage Your Calendar`
  String get secondOnBoarding {
    return Intl.message(
      'Manage Your Calendar',
      name: 'secondOnBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Productivity`
  String get thirdOnBoarding {
    return Intl.message(
      'Productivity',
      name: 'thirdOnBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Tasks finished`
  String get tasksFinished {
    return Intl.message(
      'Tasks finished',
      name: 'tasksFinished',
      desc: '',
      args: [],
    );
  }

  /// `Build Positive Habits`
  String get fourthOnBoarding {
    return Intl.message(
      'Build Positive Habits',
      name: 'fourthOnBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Start by organizing all your tasks in one place. Our intuitive task manager helps you prioritize and keep track of what needs to be done. Add deadlines, set priorities, and never miss an important task again.`
  String get firstOnBoardingDesc {
    return Intl.message(
      'Start by organizing all your tasks in one place. Our intuitive task manager helps you prioritize and keep track of what needs to be done. Add deadlines, set priorities, and never miss an important task again.',
      name: 'firstOnBoardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Easily sync your tasks with our integrated calendar. Schedule your days, weeks, and months with a clear view of your commitments. Stay ahead with reminders and keep your life well-organized.`
  String get secondOnBoardingDesc {
    return Intl.message(
      'Easily sync your tasks with our integrated calendar. Schedule your days, weeks, and months with a clear view of your commitments. Stay ahead with reminders and keep your life well-organized.',
      name: 'secondOnBoardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Keep track of how you spend your time with our built-in time tracking feature. Identify your productivity patterns and make informed decisions to improve efficiency. Work smarter, not harder.`
  String get thirdOnBoardingDesc {
    return Intl.message(
      'Keep track of how you spend your time with our built-in time tracking feature. Identify your productivity patterns and make informed decisions to improve efficiency. Work smarter, not harder.',
      name: 'thirdOnBoardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Develop and maintain healthy habits with our habit tracker. Set daily, weekly, or monthly goals and watch your progress. Consistency is key to success, and we're here to help you every step of the way.`
  String get fourthOnBoardingDesc {
    return Intl.message(
      'Develop and maintain healthy habits with our habit tracker. Set daily, weekly, or monthly goals and watch your progress. Consistency is key to success, and we\'re here to help you every step of the way.',
      name: 'fourthOnBoardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Favorite tasks`
  String get favTasks {
    return Intl.message(
      'Favorite tasks',
      name: 'favTasks',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Habits`
  String get favHabits {
    return Intl.message(
      'Favorite Habits',
      name: 'favHabits',
      desc: '',
      args: [],
    );
  }

  /// `Here you can see your favourite tasks`
  String get hereYouCanSeeYourFavTasks {
    return Intl.message(
      'Here you can see your favourite tasks',
      name: 'hereYouCanSeeYourFavTasks',
      desc: '',
      args: [],
    );
  }

  /// `Here you can see your favourite habits`
  String get hereYouCanSeeYourFavHabits {
    return Intl.message(
      'Here you can see your favourite habits',
      name: 'hereYouCanSeeYourFavHabits',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `You are about to open a 50-minute session with a 5-minute break`
  String get youAreAboutToOpenWorkSession {
    return Intl.message(
      'You are about to open a 50-minute session with a 5-minute break',
      name: 'youAreAboutToOpenWorkSession',
      desc: '',
      args: [],
    );
  }

  /// `50 min work`
  String get fiftyMinWork {
    return Intl.message(
      '50 min work',
      name: 'fiftyMinWork',
      desc: '',
      args: [],
    );
  }

  /// `5 min Break`
  String get fiveMinBreak {
    return Intl.message(
      '5 min Break',
      name: 'fiveMinBreak',
      desc: '',
      args: [],
    );
  }

  /// `In a working session`
  String get inWorkSession {
    return Intl.message(
      'In a working session',
      name: 'inWorkSession',
      desc: '',
      args: [],
    );
  }

  /// `In a break session`
  String get inBreakSession {
    return Intl.message(
      'In a break session',
      name: 'inBreakSession',
      desc: '',
      args: [],
    );
  }

  /// `Take a Break and Lock Your Phone!`
  String get takeABreak {
    return Intl.message(
      'Take a Break and Lock Your Phone!',
      name: 'takeABreak',
      desc: '',
      args: [],
    );
  }

  /// `Edit the habit`
  String get editHabit {
    return Intl.message(
      'Edit the habit',
      name: 'editHabit',
      desc: '',
      args: [],
    );
  }

  /// `Start now!`
  String get startNow {
    return Intl.message(
      'Start now!',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Work Time`
  String get workTime {
    return Intl.message(
      'Work Time',
      name: 'workTime',
      desc: '',
      args: [],
    );
  }

  /// `Break Time`
  String get breakTime {
    return Intl.message(
      'Break Time',
      name: 'breakTime',
      desc: '',
      args: [],
    );
  }

  /// `You are now about to modify an existing habit`
  String get youCanEditHabit {
    return Intl.message(
      'You are now about to modify an existing habit',
      name: 'youCanEditHabit',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Tasks`
  String get onGoingTasks {
    return Intl.message(
      'Ongoing Tasks',
      name: 'onGoingTasks',
      desc: '',
      args: [],
    );
  }

  /// `Gregorian calendar!`
  String get gregorianCalendar {
    return Intl.message(
      'Gregorian calendar!',
      name: 'gregorianCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Your tasks for that day`
  String get yourTasksForThatDay {
    return Intl.message(
      'Your tasks for that day',
      name: 'yourTasksForThatDay',
      desc: '',
      args: [],
    );
  }

  /// `Add a new task`
  String get addNewTask {
    return Intl.message(
      'Add a new task',
      name: 'addNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Here you can find out your time!`
  String get hereYouCanFindOutYourTime {
    return Intl.message(
      'Here you can find out your time!',
      name: 'hereYouCanFindOutYourTime',
      desc: '',
      args: [],
    );
  }

  /// `24 hours a day, 7 days!`
  String get twentyFourHoursADay7Days {
    return Intl.message(
      '24 hours a day, 7 days!',
      name: 'twentyFourHoursADay7Days',
      desc: '',
      args: [],
    );
  }

  /// `Your continued use.`
  String get yourContinuedUse {
    return Intl.message(
      'Your continued use.',
      name: 'yourContinuedUse',
      desc: '',
      args: [],
    );
  }

  /// `To set usage limits for each!`
  String get toSetUsageLimitsForEach {
    return Intl.message(
      'To set usage limits for each!',
      name: 'toSetUsageLimitsForEach',
      desc: '',
      args: [],
    );
  }

  /// `Time of use`
  String get timeOfUse {
    return Intl.message(
      'Time of use',
      name: 'timeOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Limitations of use`
  String get limitationsOfUse {
    return Intl.message(
      'Limitations of use',
      name: 'limitationsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Habits to accomplish today!`
  String get habitsToAccomplishToday {
    return Intl.message(
      'Habits to accomplish today!',
      name: 'habitsToAccomplishToday',
      desc: '',
      args: [],
    );
  }

  /// `Habits you completed today!`
  String get habitsYouCompletedToday {
    return Intl.message(
      'Habits you completed today!',
      name: 'habitsYouCompletedToday',
      desc: '',
      args: [],
    );
  }

  /// `Add a new habit`
  String get addNewHabit {
    return Intl.message(
      'Add a new habit',
      name: 'addNewHabit',
      desc: '',
      args: [],
    );
  }

  /// `Welcome `
  String get welcome {
    return Intl.message(
      'Welcome ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `User! `
  String get user {
    return Intl.message(
      'User! ',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `to ZFlow`
  String get toZFlow {
    return Intl.message(
      'to ZFlow',
      name: 'toZFlow',
      desc: '',
      args: [],
    );
  }

  /// `Continue with google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `You can track your progress here!`
  String get youCanTrackYourProgress {
    return Intl.message(
      'You can track your progress here!',
      name: 'youCanTrackYourProgress',
      desc: '',
      args: [],
    );
  }

  /// `Completed tasks`
  String get completedTasks {
    return Intl.message(
      'Completed tasks',
      name: 'completedTasks',
      desc: '',
      args: [],
    );
  }

  /// `Pending tasks`
  String get pendingTasks {
    return Intl.message(
      'Pending tasks',
      name: 'pendingTasks',
      desc: '',
      args: [],
    );
  }

  /// `Completed habits`
  String get completedHabits {
    return Intl.message(
      'Completed habits',
      name: 'completedHabits',
      desc: '',
      args: [],
    );
  }

  /// `Pending habits`
  String get pendingHabits {
    return Intl.message(
      'Pending habits',
      name: 'pendingHabits',
      desc: '',
      args: [],
    );
  }

  /// `You can continue with`
  String get youCanContinueWith {
    return Intl.message(
      'You can continue with',
      name: 'youCanContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `FirstName`
  String get firstName {
    return Intl.message(
      'FirstName',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `LastName`
  String get lastName {
    return Intl.message(
      'LastName',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// ` No worries! Enter your email address to reset it and regain access to your account.`
  String get noWorries {
    return Intl.message(
      ' No worries! Enter your email address to reset it and regain access to your account.',
      name: 'noWorries',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Easily add your tasks, detail them, add notes and set an end date!`
  String get easilyAddYourTasks {
    return Intl.message(
      'Easily add your tasks, detail them, add notes and set an end date!',
      name: 'easilyAddYourTasks',
      desc: '',
      args: [],
    );
  }

  /// `Task..`
  String get task {
    return Intl.message(
      'Task..',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Ends in..`
  String get endsIn {
    return Intl.message(
      'Ends in..',
      name: 'endsIn',
      desc: '',
      args: [],
    );
  }

  /// `Subtask`
  String get subTask {
    return Intl.message(
      'Subtask',
      name: 'subTask',
      desc: '',
      args: [],
    );
  }

  /// `Add a subtask`
  String get addSubTask {
    return Intl.message(
      'Add a subtask',
      name: 'addSubTask',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favourite {
    return Intl.message(
      'Favorite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Effortlessly manage your life with our app: organize tasks, track habits, optimize time, achieve goals, get reminders, save links, and start work sessions!`
  String get effortlesslyManage {
    return Intl.message(
      'Effortlessly manage your life with our app: organize tasks, track habits, optimize time, achieve goals, get reminders, save links, and start work sessions!',
      name: 'effortlesslyManage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to access your personalized dashboard and stay productive.`
  String get pleaseLogin {
    return Intl.message(
      'Please log in to access your personalized dashboard and stay productive.',
      name: 'pleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `Get started today!`
  String get getStarted {
    return Intl.message(
      'Get started today!',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to unlock personalized features and start managing your tasks and goals effectively.`
  String get signUpToUnlock {
    return Intl.message(
      'Sign up to unlock personalized features and start managing your tasks and goals effectively.',
      name: 'signUpToUnlock',
      desc: '',
      args: [],
    );
  }

  /// `You’ve successfully completed your task. Keep up the great work and continue making progress toward your goals!`
  String get youCompletedYourTask {
    return Intl.message(
      'You’ve successfully completed your task. Keep up the great work and continue making progress toward your goals!',
      name: 'youCompletedYourTask',
      desc: '',
      args: [],
    );
  }

  /// `You are now about to add a new habit!`
  String get youAreAboutToAddHabit {
    return Intl.message(
      'You are now about to add a new habit!',
      name: 'youAreAboutToAddHabit',
      desc: '',
      args: [],
    );
  }

  /// `Habit..`
  String get habit {
    return Intl.message(
      'Habit..',
      name: 'habit',
      desc: '',
      args: [],
    );
  }

  /// `Habit days..`
  String get habitDays {
    return Intl.message(
      'Habit days..',
      name: 'habitDays',
      desc: '',
      args: [],
    );
  }

  /// `Reminder of this habit`
  String get reminderToHabit {
    return Intl.message(
      'Reminder of this habit',
      name: 'reminderToHabit',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get daily {
    return Intl.message(
      'Daily',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `6 days a week`
  String get sixDaysAweek {
    return Intl.message(
      '6 days a week',
      name: 'sixDaysAweek',
      desc: '',
      args: [],
    );
  }

  /// `5 days a week`
  String get fiveDaysAweek {
    return Intl.message(
      '5 days a week',
      name: 'fiveDaysAweek',
      desc: '',
      args: [],
    );
  }

  /// `4 days a week`
  String get fourDaysAweek {
    return Intl.message(
      '4 days a week',
      name: 'fourDaysAweek',
      desc: '',
      args: [],
    );
  }

  /// `Great Job!`
  String get greatJob {
    return Intl.message(
      'Great Job!',
      name: 'greatJob',
      desc: '',
      args: [],
    );
  }

  /// `Edit the task`
  String get editTask {
    return Intl.message(
      'Edit the task',
      name: 'editTask',
      desc: '',
      args: [],
    );
  }

  /// `Finish the task`
  String get finishTask {
    return Intl.message(
      'Finish the task',
      name: 'finishTask',
      desc: '',
      args: [],
    );
  }

  /// `Easily know how long you use each application!`
  String get easilyKnowHowLongYouUseApp {
    return Intl.message(
      'Easily know how long you use each application!',
      name: 'easilyKnowHowLongYouUseApp',
      desc: '',
      args: [],
    );
  }

  /// `Easily edit your tasks, detail them, add notes and set an end date!`
  String get easilyEditTasks {
    return Intl.message(
      'Easily edit your tasks, detail them, add notes and set an end date!',
      name: 'easilyEditTasks',
      desc: '',
      args: [],
    );
  }

  /// `Start a work session`
  String get startWorkSession {
    return Intl.message(
      'Start a work session',
      name: 'startWorkSession',
      desc: '',
      args: [],
    );
  }

  /// `My lists`
  String get myLists {
    return Intl.message(
      'My lists',
      name: 'myLists',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Last Day`
  String get lastDay {
    return Intl.message(
      'Last Day',
      name: 'lastDay',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 days`
  String get last7Days {
    return Intl.message(
      'Last 7 days',
      name: 'last7Days',
      desc: '',
      args: [],
    );
  }

  /// `Last 28 days`
  String get last28Days {
    return Intl.message(
      'Last 28 days',
      name: 'last28Days',
      desc: '',
      args: [],
    );
  }

  /// `All tasks`
  String get allTasks {
    return Intl.message(
      'All tasks',
      name: 'allTasks',
      desc: '',
      args: [],
    );
  }

  /// `Stay Away`
  String get stayAway {
    return Intl.message(
      'Stay Away',
      name: 'stayAway',
      desc: '',
      args: [],
    );
  }

  /// `My Goals`
  String get myGoals {
    return Intl.message(
      'My Goals',
      name: 'myGoals',
      desc: '',
      args: [],
    );
  }

  /// `Task categories`
  String get taskCats {
    return Intl.message(
      'Task categories',
      name: 'taskCats',
      desc: '',
      args: [],
    );
  }

  /// `Favorite tasks`
  String get favoriteTasks {
    return Intl.message(
      'Favorite tasks',
      name: 'favoriteTasks',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Habits`
  String get favoriteHabits {
    return Intl.message(
      'Favorite Habits',
      name: 'favoriteHabits',
      desc: '',
      args: [],
    );
  }

  /// `Add home widget`
  String get addHomeWidget {
    return Intl.message(
      'Add home widget',
      name: 'addHomeWidget',
      desc: '',
      args: [],
    );
  }

  /// `Financial support`
  String get financialSupport {
    return Intl.message(
      'Financial support',
      name: 'financialSupport',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Share the app`
  String get shareApp {
    return Intl.message(
      'Share the app',
      name: 'shareApp',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get rateUs {
    return Intl.message(
      'Rate us',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Help and feedback`
  String get helpAndFeedback {
    return Intl.message(
      'Help and feedback',
      name: 'helpAndFeedback',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about {
    return Intl.message(
      'About us',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `On this page, you can write down your future goals here!`
  String get onThisPage {
    return Intl.message(
      'On this page, you can write down your future goals here!',
      name: 'onThisPage',
      desc: '',
      args: [],
    );
  }

  /// `Add a new goal`
  String get addAGoal {
    return Intl.message(
      'Add a new goal',
      name: 'addAGoal',
      desc: '',
      args: [],
    );
  }

  /// `Great, you are now about to write new goals!`
  String get writeAGoal {
    return Intl.message(
      'Great, you are now about to write new goals!',
      name: 'writeAGoal',
      desc: '',
      args: [],
    );
  }

  /// `Edit goal`
  String get editGoal {
    return Intl.message(
      'Edit goal',
      name: 'editGoal',
      desc: '',
      args: [],
    );
  }

  /// `You are now about to edit an existing goal!`
  String get editExistingGoal {
    return Intl.message(
      'You are now about to edit an existing goal!',
      name: 'editExistingGoal',
      desc: '',
      args: [],
    );
  }

  /// `Help you stay organized and on top of your agenda!`
  String get helpYouStayOrganized {
    return Intl.message(
      'Help you stay organized and on top of your agenda!',
      name: 'helpYouStayOrganized',
      desc: '',
      args: [],
    );
  }

  /// `Your events are coming!`
  String get yourEvents {
    return Intl.message(
      'Your events are coming!',
      name: 'yourEvents',
      desc: '',
      args: [],
    );
  }

  /// `Event..`
  String get event {
    return Intl.message(
      'Event..',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Reminder of this event`
  String get reminderOfEvent {
    return Intl.message(
      'Reminder of this event',
      name: 'reminderOfEvent',
      desc: '',
      args: [],
    );
  }

  /// `Start in..`
  String get startIn {
    return Intl.message(
      'Start in..',
      name: 'startIn',
      desc: '',
      args: [],
    );
  }

  /// `Event days`
  String get eventDays {
    return Intl.message(
      'Event days',
      name: 'eventDays',
      desc: '',
      args: [],
    );
  }

  /// `Add to your categories?`
  String get addToYourCategories {
    return Intl.message(
      'Add to your categories?',
      name: 'addToYourCategories',
      desc: '',
      args: [],
    );
  }

  /// `Organizing tasks into categories helps you keep your workflow efficient and ensures nothing gets overlooked.`
  String get organizingTasks {
    return Intl.message(
      'Organizing tasks into categories helps you keep your workflow efficient and ensures nothing gets overlooked.',
      name: 'organizingTasks',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `All set! You're connected to the internet.`
  String get connectedToInternet {
    return Intl.message(
      'All set! You\'re connected to the internet.',
      name: 'connectedToInternet',
      desc: '',
      args: [],
    );
  }

  /// `Oops, it looks like you're offline!`
  String get disconnectedFromInternet {
    return Intl.message(
      'Oops, it looks like you\'re offline!',
      name: 'disconnectedFromInternet',
      desc: '',
      args: [],
    );
  }

  /// `Finished Tasks Last Day`
  String get finishedTasksLastDay {
    return Intl.message(
      'Finished Tasks Last Day',
      name: 'finishedTasksLastDay',
      desc: '',
      args: [],
    );
  }

  /// `Finished Tasks Last 7 Days`
  String get finishedTasksLast7Days {
    return Intl.message(
      'Finished Tasks Last 7 Days',
      name: 'finishedTasksLast7Days',
      desc: '',
      args: [],
    );
  }

  /// `Finished Tasks Last 28 Days`
  String get finishedTasksLast28Days {
    return Intl.message(
      'Finished Tasks Last 28 Days',
      name: 'finishedTasksLast28Days',
      desc: '',
      args: [],
    );
  }

  /// `Done Habits Last Day`
  String get doneHabitsLastDay {
    return Intl.message(
      'Done Habits Last Day',
      name: 'doneHabitsLastDay',
      desc: '',
      args: [],
    );
  }

  /// `Done Habits Last 7 Days`
  String get doneHabits7Days {
    return Intl.message(
      'Done Habits Last 7 Days',
      name: 'doneHabits7Days',
      desc: '',
      args: [],
    );
  }

  /// `Done Habits Last 28 Days`
  String get doneHabits28Days {
    return Intl.message(
      'Done Habits Last 28 Days',
      name: 'doneHabits28Days',
      desc: '',
      args: [],
    );
  }

  /// `All Done Habits`
  String get allDoneHabits {
    return Intl.message(
      'All Done Habits',
      name: 'allDoneHabits',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Habits Last Day`
  String get ongoingHabitsLastDay {
    return Intl.message(
      'Ongoing Habits Last Day',
      name: 'ongoingHabitsLastDay',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Habits Last 7 Days`
  String get ongoingHabitsLast7Days {
    return Intl.message(
      'Ongoing Habits Last 7 Days',
      name: 'ongoingHabitsLast7Days',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Habits Last 28 Days`
  String get ongoingHabitsLast28Days {
    return Intl.message(
      'Ongoing Habits Last 28 Days',
      name: 'ongoingHabitsLast28Days',
      desc: '',
      args: [],
    );
  }

  /// `All Ongoing Habits`
  String get allOngoingHabits {
    return Intl.message(
      'All Ongoing Habits',
      name: 'allOngoingHabits',
      desc: '',
      args: [],
    );
  }

  /// `Logged in successfully`
  String get loggedInSuccess {
    return Intl.message(
      'Logged in successfully',
      name: 'loggedInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Search For Tasks`
  String get searchForTasks {
    return Intl.message(
      'Search For Tasks',
      name: 'searchForTasks',
      desc: '',
      args: [],
    );
  }

  /// `Search For Habits`
  String get searchForHabits {
    return Intl.message(
      'Search For Habits',
      name: 'searchForHabits',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
