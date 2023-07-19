import 'package:bloc/bloc.dart';

int i = 0;

class NavigationInBottomBarCubit extends Cubit<int> {
  NavigationInBottomBarCubit() : super(i);

  void onIndexChange(int val) {
    emit(i = val);
  }
}
