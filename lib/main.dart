import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/cubit/app_cubit/apiclass.dart';
import 'package:newsapp/presentaion/flashscreen/view.dart';

import 'cubit/changetheme/cubit/change_theme_cubit.dart';
import 'cubit/changetheme/cubit/change_theme_state.dart';
import 'services/web_services/web_services.dart';

void main() {
  ApiHelper.initialConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Api()
            ..getBusinessNews()
            ..gettechnologyNews()
            ..getSportNews()
            ..gethealthNews(),
        ),
        BlocProvider(
          create: (context) => ChangeThemeCubit()..saveTheme(),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: light,
            darkTheme: dark,
            themeMode: BlocProvider.of<ChangeThemeCubit>(context).theme,
            debugShowCheckedModeBanner: false,
            home: const FlashScreen(),
          );
        },
      ),
    );
  }
}
