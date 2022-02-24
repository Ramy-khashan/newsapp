import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/bottombar/controller.dart';
import 'package:newsapp/screens/bottombar/state.dart';

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
              currentIndex: controller.index,
              selectedItemColor: Colors.amber[700],
              backgroundColor: Colors.blueGrey,
              selectedIconTheme: IconThemeData(size: size.shortestSide * .07),
              selectedFontSize: size.shortestSide * .04,
              unselectedItemColor: Colors.grey.shade200,
              onTap: controller.onTap,
            ),
          );
        }));
  }
}
