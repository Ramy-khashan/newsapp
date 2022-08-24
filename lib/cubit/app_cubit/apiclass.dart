import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant.dart';

import '../../models/news_model.dart';
import '../../services/web_services/web_services.dart';
import 'states.dart';

class Api extends Cubit<ApiStates> {
  List<NewsApi> businessNews = [];
  List<NewsApi> healthNews = [];
  List<NewsApi> technologyNews = [];
  List<NewsApi> sportNews = [];
  bool isLoading = false;

  Api() : super(InitialApiStates());

  static Api get(context) => BlocProvider.of(context);
  getBusinessNews() async {
    isLoading = true;
    businessNews = [];
    emit(LoadingData());
    try {
      businessNews = await ApiHelper.getNews(url: method, query: {
        "country": "eg",
        "category": "business",
        "apiKey": apiKey,
      });
      isLoading = false;

      emit(GetBusinessNewsState());
    } catch (e) {
      businessNews = [];
      isLoading = false;

      emit(FailedData());
    }
  }

  gettechnologyNews() async {
    isLoading = true;

    technologyNews = [];
    emit(LoadingData());

    try {
      technologyNews = await ApiHelper.getNews(url: method, query: {
        "country": "eg",
        "category": "technology",
        "apiKey": apiKey,
      });
      isLoading = false;

      emit(GetTechnologyNewsState());
    } catch (e) {
      technologyNews = [];
      isLoading = false;

      emit(FailedData());
    }
  }

  gethealthNews() async {
    healthNews = [];
    isLoading = true;

    emit(LoadingData());

    try {
      healthNews = await ApiHelper.getNews(url: method, query: {
        "country": "eg",
        "category": "health",
        "apiKey": apiKey,
      });
      isLoading = false;

      emit(GetHealthNewsState());
    } catch (e) {
      healthNews = [];
      isLoading = false;

      emit(FailedData());
    }
  }

  getSportNews() async {
    sportNews = [];
    isLoading = true;

    emit(LoadingData());

    try {
      sportNews = await ApiHelper.getNews(url: method, query: {
        "country": "eg",
        "category": "sports",
        "apiKey": apiKey,
      });
      isLoading = false;

      emit(GetSportNewsState());
    } catch (e) {
      log(e.toString());
      sportNews = [];
      isLoading = false;

      emit(FailedData());
    }
  }
}
