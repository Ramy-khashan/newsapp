import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';
import '../../cubit/app_cubit/apiclass.dart';
import '../../cubit/app_cubit/states.dart';
import '../../shared/empty_shape.dart';
import '../../shared/loading_shape.dart';
import '../../shared/view_news.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

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
                    controller.getBusinessNews();
                  },
                  child: controller.businessNews.isEmpty
                      ? const EmptyItem()
                      : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * .01,
                        horizontal: size.shortestSide * .01),
                    itemBuilder: (context, index) {
                      return ViewNewsItem(
                        size: size,
                        description: controller.businessNews[index].description,
                        title: controller.businessNews[index].title,
                        img: controller.businessNews[index].urlToImage,
                        source: controller.businessNews[index].source.name,
                        url: controller.businessNews[index].url,
                      );
                    },
                    itemCount: controller.businessNews.length,
                  ),
                );
        },
      ),
    );
  }
}
