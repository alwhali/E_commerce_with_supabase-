import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(IndexChanged());
  }
}
