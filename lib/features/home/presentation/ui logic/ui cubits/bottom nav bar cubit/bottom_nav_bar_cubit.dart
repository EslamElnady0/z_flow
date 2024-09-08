import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarChange());
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(BottomNavBarChange());
  }
}
