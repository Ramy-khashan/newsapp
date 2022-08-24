import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/navigator_bar/navigator_bar_state.dart';
import 'package:newsapp/presentaion/business/view.dart';
import 'package:newsapp/presentaion/health/view.dart';
import 'package:newsapp/presentaion/sport/view.dart';

import '../../presentaion/technology/view.dart';

class BottomBarController extends Cubit<BottomBarStates> {
  List classesList = const [
    BusinessScreen(),
    HealthScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];
  List appbarHead = ["Business", "Health", "Sport", "Technology"];
  int index = 0;
  void onTap(int i) {
    index = i;
    emit(ChangePage());
  }

  BottomBarController() : super(InitialBottomBar());

  static BottomBarController get(context) => BlocProvider.of(context);
}
