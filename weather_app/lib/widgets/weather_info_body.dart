import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweather_cubit/getweather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weatherModel.weatherconditionName),
          getThemeColor(weatherModel.weatherconditionName)[700]!,
          getThemeColor(weatherModel.weatherconditionName)[600]!,
          getThemeColor(weatherModel.weatherconditionName)[500]!,
          getThemeColor(weatherModel.weatherconditionName)[300]!,
          getThemeColor(weatherModel.weatherconditionName)[200]!,
          getThemeColor(weatherModel.weatherconditionName)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Updated at ${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute}\n    ${weatherModel.lastUpdated.day}/${weatherModel.lastUpdated.month}/${weatherModel.lastUpdated.year} ",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(weatherModel.image.contains("https:")
                    ? weatherModel.image
                    : 'https:${weatherModel.image}'),
                Text(
                  '${weatherModel.temp.round()}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp : ${weatherModel.maxtemp.round()}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "MinTemp : ${weatherModel.mintemp.round()}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherconditionName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
