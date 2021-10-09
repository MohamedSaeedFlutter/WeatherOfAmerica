import 'dart:convert';

import 'package:american_weather/api/states.dart';
import 'package:american_weather/models/weather_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class FetchApi extends Cubit<ChangState> {
  FetchApi() : super(InitialState());
  static FetchApi get(context) => BlocProvider.of(context);

  // Future<void> sendWeather() async {
  //   http.post(Uri(path:
  //   "https://console.firebase.google.com/u/0/project/amazing-counter-d892021/firestore/data/"),
  //       body: WeatherApi().toJson())
  //       .then((res) {
  //     print(res.body.toString());
  //   });
  // }


  Future<WeatherAp> getWeather({String zipCode}) async {
    WeatherAp  weather;
    String link ="http://api.openweathermap.org/data/2.5/weather?zip=" +
        zipCode +
        ",us&APPID=661daa7377189bfe425b6af1f07ac279" ;
    var url = Uri.parse( link );
    http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
    });
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print("weatherweatherweatherweatherweather11111111body${body}");
      weather = WeatherAp.fromJson(body);
      print("weatherweatherweatherweatherweather11111111$weather");
    } else if (response.statusCode == 404) {
      print("not foundnot foundnot found");
    } else if (response.statusCode == 500) {
      print(
          "server not responding.server not responding.server not responding.");
    } else {
      print(
          "some other error or might be CORS policy error. you can add your url in CORS policy.");
    }
    return weather;
  }



// Future<WeatherModel> getWeather({String zipCode}) async {
//     WeatherModel  weather;
//     var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?"
//         "zip=$zipCode,us&APPID=661daa7377189bfe425b6af1f07ac279");
//     http.Response response = await http.get(url, headers: {
//       'Content-Type': 'application/json',
//       'Access-Control-Allow-Origin': '*',
//       'Access-Control-Allow-Credentials': 'true',
//       'Access-Control-Allow-Headers': 'Content-Type',
//       'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
//     });
//     if (response.statusCode == 200) {
//       var body = json.decode(response.body);
//       print("weatherweatherweatherweatherweather11111111body${body}");
//         weather = WeatherModel.fromJson(body);
//       print("weatherweatherweatherweatherweather11111111$weather");
//     } else if (response.statusCode == 404) {
//       print("not foundnot foundnot found");
//     } else if (response.statusCode == 500) {
//       print(
//           "server not responding.server not responding.server not responding.");
//     } else {
//       print(
//           "some other error or might be CORS policy error. you can add your url in CORS policy.");
//     }
//     return weather;
//   }





}
