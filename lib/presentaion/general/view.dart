import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/shared/empty_shape.dart';

import '../../cubit/app_cubit/apiclass.dart';
import '../../cubit/app_cubit/states.dart';
import '../../shared/loading_shape.dart';
import '../../shared/view_news.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);

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
                    controller.getGeneralNews();
                  },
                  child: controller.generalNews.isEmpty
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
                                  controller.generalNews[index].description,
                              title: controller.generalNews[index].title,
                              img: controller.generalNews[index].urlToImage,
                              source: controller.generalNews[index].source.name,
                              url: controller.generalNews[index].url,
                            );
                          },
                          itemCount: controller.generalNews.length,
                        ),
                );
        },
      ),
    );
  }
}
