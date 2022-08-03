import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import '../../cubit/app_cubit/states.dart';
import '../../cubit/app_cubit/apiclass.dart';
import '../../shared/loading_shape.dart';
import '../../shared/view_news.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<Api, ApiStates>(
        builder: (context, state) {
          final controller = Api.get(context);
          return controller.isLoading == true
              ? const LoadingShapeItem()
              : RefreshIndicator(
                color: mainColor,
                  onRefresh: () async {
                    controller.getSportNews();
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * .01,
                        horizontal: size.shortestSide * .01),
                    itemBuilder: (context, index) {
                      return ViewNewsItem(
                        source: controller.sportNews[index].source.name,
                        size: size,
                        description: controller.sportNews[index].description,
                        title: controller.sportNews[index].title,
                        img: controller.sportNews[index].urlToImage,
                        url: controller.sportNews[index].url,
                      );
                    },
                    itemCount: controller.sportNews.length,
                  ),
                );
        },
      ),
    );
  }
}
