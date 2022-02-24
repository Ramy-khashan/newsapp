import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/classes/apiclass.dart';
import 'package:newsapp/classes/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => Api()
        ..getNewsData(
            "https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9e9ddb07c53e423097e68651cfd4036c"),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Business",
            style: TextStyle(
              fontSize: size.shortestSide * .065,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<Api, ApiStates>(
          builder: (context, state) {
            final controller = Api.get(context);
            return controller.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: size.longestSide * .01,
                        horizontal: size.shortestSide * .01),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 25,
                        margin: EdgeInsets.only(
                          bottom: size.longestSide * .015,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    controller.newsData[index].urlToImage),
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                height: size.longestSide * .35,
                                width: double.infinity,
                              ),
                            ),
                            Text(
                              controller.newsData[index].title,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: size.shortestSide * .05,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              controller.newsData[index].description.isEmpty
                                  ? ""
                                  : controller.newsData[index].description,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: size.shortestSide * .042,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: controller.newsData.length,
                  );
          },
        ),
      ),
    );
  }
}
