import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/navigator_bar/navigator_bar_controller.dart';
import 'package:newsapp/cubit/navigator_bar/navigator_bar_state.dart';

import '../../constant.dart';
import '../../cubit/changetheme/cubit/change_theme_cubit.dart';
import '../../cubit/changetheme/cubit/change_theme_state.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => BottomBarController(),
        child: BlocBuilder<BottomBarController, BottomBarStates>(
            builder: (context, state) {
          final controller = BottomBarController.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              title: Text(
                controller.appbarHead[controller.index],
                style: TextStyle(
                  fontFamily: "one",
                  fontSize: size.shortestSide * .075,
                ),
              ),
              centerTitle: true,
            ),
            floatingActionButton:
                BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
              builder: (context, state) {
                final themeController =
                    BlocProvider.of<ChangeThemeCubit>(context);
                return FloatingActionButton.extended(
                    onPressed: () {
                      themeController.changeTheme();
                    },
                    icon: Icon(!themeController.isDark
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    label: Text(!themeController.isDark ? "Night" : "Day"));
              },
            ),
            body: Center(
              child: controller.classesList.elementAt(controller.index),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety),
                  label: 'Health',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: 'Sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'General',
                ),
              ],
              type: BottomNavigationBarType.shifting,
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
              currentIndex: controller.index,
              selectedItemColor: Theme.of(context).brightness.index == 0
                  ? Colors.white
                  : mainColor.withOpacity(.87),
              backgroundColor: Colors.blueGrey,
              selectedIconTheme: IconThemeData(size: size.shortestSide * .07),
              selectedFontSize: size.shortestSide * .04,
              unselectedItemColor: Theme.of(context).brightness.index == 0
                  ? mainColor
                  : Colors.black26,
              onTap: controller.onTap,
            ),
          );
        }));
  }
}
