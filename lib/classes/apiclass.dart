import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';
import 'states.dart';

class Api extends Cubit<ApiStates> {
  List<NewsApi> newsData = [];
  bool isLoading = false;

  Api() : super(InitialApiStates());

  static Api get(context) => BlocProvider.of(context);
  getNewsData(url) async {
    try {
      isLoading = true;
      emit(LoadingData());
      var respone = await Dio().get(url);
      var data = respone.data["articles"] as List;
      for (var element in data) {
        newsData.add(NewsApi.fromJson(element));
      }
      isLoading = false;
      emit(SuccesgData());
    } catch (e) {
      if (newsData.isEmpty) {
        isLoading = false;
        emit(FailedData());
      }
    }
  }
}
