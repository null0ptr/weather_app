import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2c24f4eedfd335bd596166566a667404&units=metric");
    var res = await http.get(endpoint);
    var body = jsonDecode(res.body);
    return Weather.fromJson(body);
  }
}
