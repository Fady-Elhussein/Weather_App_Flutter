import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweather_cubit/getweather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              await getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(30),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              label: Text(
                'Search',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              suffixIcon: Icon(Icons.search_sharp, color: Colors.orangeAccent),
              hintText: "Enter City Name",
            ),
          ),
        ),
      ),
    );
  }
}
