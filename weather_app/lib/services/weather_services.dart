import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '83fd82f0603846f2bc3140520231703';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Try Later';
      Fluttertoast.showToast(
        msg: errorMessage,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 16,
      );
      throw Exception(errorMessage);
    }
  }

  
}
