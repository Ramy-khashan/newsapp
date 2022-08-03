import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';

import '../../models/news_model.dart';
import 'states.dart';

class Api extends Cubit<ApiStates> {
  List<NewsApi> businessNews = [];
  List<NewsApi> healthNews = [];
  List<NewsApi> generalNews = [];
  List<NewsApi> sportNews = [];
  bool isLoading = false;

  Api() : super(InitialApiStates());

  static Api get(context) => BlocProvider.of(context);
  getBusinessNews() async {
    businessNews = [];
    try {
      businessNews = await getNewsData(businessUrl);
      emit(GetBusinessNewsState());
    } catch (e) {
      businessNews = [];
      emit(FailedData());
    }
  }

  getGeneralNews() async {
    generalNews = [];
    try {
      generalNews = await getNewsData(generalUrl);
      emit(GetGeneralNewsState());
    } catch (e) {
      generalNews = [];
      emit(FailedData());
    }
  }

  gethealthNews() async {
    healthNews = [];
    try {
      healthNews = await getNewsData(healthUrl);
      emit(GetHealthNewsState());
    } catch (e) {
      healthNews = [];
      emit(FailedData());
    }
  }

  getSportNews() async {
    sportNews = [];
    try {
      sportNews = await getNewsData(sportsUrl);
      emit(GetSportNewsState());
    } catch (e) {
      log(e.toString());
      sportNews = [];
      emit(FailedData());
    }
  }

  Future getNewsData(url) async {
    late List<NewsApi> newsData;

    try {
      newsData = [];
      isLoading = true;
      emit(LoadingData());
      var respone = await Dio().get(url);
      var data = respone.data["articles"] as List;
      for (var element in data) {
        newsData.add(NewsApi.fromJson(element));
      }
      isLoading = false;
      emit(SuccesgData());
      return newsData;
    } catch (e) {
      if (newsData.isEmpty) {
        isLoading = false;
        emit(FailedData());
        return [];
      }
    }
  }
}
