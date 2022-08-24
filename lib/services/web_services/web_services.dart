import 'package:dio/dio.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/models/news_model.dart';

class ApiHelper {
  static late Dio dio;
  static initialConfig() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl, method: method, receiveDataWhenStatusError: true),
    );
  }

 static Future<List<NewsApi>> getNews(
      {required String url, required Map<String, dynamic> query}) async {
    List<NewsApi> newsList = [];

    await dio.get(url, queryParameters: query).then((value) {
      var news = value.data["articles"] as List;
      for (var element in news) {
        newsList.add(NewsApi.fromJson(element));
      }
    });

    return newsList;
  }
}
