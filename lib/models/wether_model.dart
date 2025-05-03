import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String icon;
  final String wetherSateName;

  WeatherModel({
    required this.wetherSateName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
  });
  factory WeatherModel.fromjson(data) {
    var jsondata = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
      wetherSateName: jsondata['condition']['text'],
      date: data['location']['localtime'],
      temp: jsondata['avgtemp_c'],
      maxTemp: jsondata['maxtemp_c'],
      minTemp: jsondata['mintemp_c'],
      icon: jsondata['condition']['icon'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'tem = $temp , maxtem = $maxTemp , mintem = $minTemp';
  }
}
