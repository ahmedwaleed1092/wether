import 'package:flutter/material.dart';
import 'package:wether/models/wether_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _wether;
  String? cityName;
  set wether(WeatherModel? wether) {
    _wether = wether;
    notifyListeners();
  }

  WeatherModel? get wether => _wether;
  Future searchSubmit(String? nameOfCity) async {
    cityName = nameOfCity;
    _wether = await getWether();
    notifyListeners();
  }

  Future<WeatherModel> getWether() async {
    String apiKey = '93fde835487341a09c8152046252604';
    String baseUrl = 'http://api.weatherapi.com/v1';
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no',
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    return WeatherModel.fromjson(data);
  }
}
