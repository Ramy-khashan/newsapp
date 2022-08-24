import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/shared/empty_shape.dart';

import '../../cubit/app_cubit/apiclass.dart';
import '../../cubit/app_cubit/states.dart';
import '../../shared/loading_shape.dart';
import '../../shared/view_news.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

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
                    controller.gettechnologyNews();
                  },
                  child: controller.technologyNews.isEmpty
                      ? const EmptyItem()
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              vertical: size.longestSide * .01,
                              horizontal: size.shortestSide * .01),
                          itemBuilder: (context, index) {
                            return ViewNewsItem(
                              size: size,
                              description:
                                  controller.technologyNews[index].description,
                              title: controller.technologyNews[index].title,
                              img: controller.technologyNews[index].urlToImage,
                              source: controller.technologyNews[index].source.name,
                              url: controller.technologyNews[index].url,
                            );
                          },
                          itemCount: controller.technologyNews.length,
                        ),
                );
        },
      ),
    );
  }
}
