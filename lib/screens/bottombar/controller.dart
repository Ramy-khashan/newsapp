import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/bottombar/state.dart';
import 'package:newsapp/screens/business/view.dart';
import 'package:newsapp/screens/general/view.dart';
import 'package:newsapp/screens/health/view.dart';
import 'package:newsapp/screens/sport/view.dart';

class BottomBarController extends Cubit<BottomBarStates> {
  List classesList = const [
    BusinessScreen(),
    HealthScreen(),
    SportsScreen(),
    GeneralScreen(),
  ];
  int index = 0;
  void onTap(int i) {
    index = i;
    emit(ChangePage());
  }

  BottomBarController() : super(InitialBottomBar());

  static BottomBarController get(context) => BlocProvider.of(context);
}
