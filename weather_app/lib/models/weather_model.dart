class WeatherModel {
  final String name;
  final String image;
  final String weatherconditionName;
  final DateTime lastUpdated;
  final double temp;
  final double maxtemp;
  final double mintemp;
  WeatherModel({
    required this.image,
    required this.temp,
    required this.name,
    required this.weatherconditionName,
    required this.lastUpdated,
    required this.maxtemp,
    required this.mintemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      name: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherconditionName: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      lastUpdated: DateTime.parse(
        json['current']['last_updated'],
      ),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
