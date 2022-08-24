import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';

import '../../cubit/app_cubit/apiclass.dart';
import '../../cubit/app_cubit/states.dart';
import '../../shared/empty_shape.dart';
import '../../shared/loading_shape.dart';
import '../../shared/view_news.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

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
                    controller.gethealthNews();
                  },
                  child: controller.healthNews.isEmpty
                      ? const EmptyItem()
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              vertical: size.longestSide * .01,
                              horizontal: size.shortestSide * .01),
                          itemBuilder: (context, index) {
                            return ViewNewsItem(
                              source: controller.healthNews[index].source.name,
                              size: size,
                              description:
                                  controller.healthNews[index].description,
                              title: controller.healthNews[index].title,
                              img: controller.healthNews[index].urlToImage,
                              url: controller.healthNews[index].url,
                            );
                          },
                          itemCount: controller.healthNews.length,
                        ),
                );
        },
      ),
    );
  }
}
