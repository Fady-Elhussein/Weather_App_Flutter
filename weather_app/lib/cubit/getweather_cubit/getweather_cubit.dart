import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweather_states/getweather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialWeatherState());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices().getCurrentWeather(cityName: cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(FailerWeatherState());
    }
  }
}
