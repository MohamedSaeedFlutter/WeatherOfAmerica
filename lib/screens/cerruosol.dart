import 'package:american_weather/models/cities_zip.dart';
import 'package:american_weather/api/fetch_api.dart';
import 'package:american_weather/api/states.dart';
import 'package:american_weather/models/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullscreenSliderDemo extends StatelessWidget {

List<String> imgList = [
      "https://upload.wikimedia.org/wikipedia/commons/2/24/ALASKA_%284477354433%29.jpg",
      "data:image/jpeg;base64,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",
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AALASKA_(4477354433).jpg&psig=AOvVaw2f3-FAjXDrcLaDPe8GDqOU&ust=1633806982331000&source=images&cd=vfe&ved=0CAkQjRxqFwoTCNjCsMPDu_MCFQAAAAAdAAAAABAD",
    ];
    // List<String> zipList = ["10001","94016","99501"];
    // List<String> citysList = ["NewYork", "San Fransisco", "Alaska"];
var i = CitiesZipCodes.cities.indexOf("Colorado");
String dropdownValue = "California";
int listIndex  = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Of America')),
      body:
      Center(
        child: Column(children: [
          SizedBox(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:  [
                const SizedBox(height: 14,),
                const Text("Choose State",  style: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.pinkAccent,
        fontSize: 48,),),
                const SizedBox(height: 6,),
                DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 32,
            elevation: 18,
            style: const TextStyle(color: Colors.orange, fontSize: 18,
                fontWeight: FontWeight.w600),
            underline: Container(
            height: 2,
            color: Colors.orange,
            ),
            onTap: () {
              listIndex =CitiesZipCodes.cities.indexOf(dropdownValue);
              FetchApi.get(context).emit(VarsState());
            },
            onChanged: (String newValue) {
              dropdownValue = newValue;
              FetchApi.get(context).emit(VarsState());
            },
            items: CitiesZipCodes.cities
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
            }).toList(),
        ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
const SizedBox(height: 10,),
BlocConsumer<FetchApi, ChangState>(
listener: (context, state) { print(state);},
builder: (context, state) {
  print(state);
  print(" bloc Consumer works");
  return FutureBuilder<WeatherAp>(
    future: FetchApi.get(context).getWeather(
        zipCode: CitiesZipCodes.zips[listIndex].toString()),
    builder: (context, snapshot) {
      var weather = snapshot.data;
      print("weatherweatherweatherweatherweather$weather");
      print("${snapshot.error}snapshot.errorsnapshot.errorsnapshot.error");
      return
      Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dropdownValue, style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.pinkAccent,
              fontSize: 42,),),
      const SizedBox(height: 8,),
      Text(weather.weather.first.description, style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.redAccent,
        fontSize: 18,),),

      Text('Temperature  ${((weather.main.temp) -272.15).round().toString()} C', style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.redAccent,
      fontSize: 18,),),
      Text('The Lowest Temp  ${((weather.main.tempMin) -272.15).round().toString()} C', style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.redAccent,
      fontSize: 18,),),
      Text('The highest Temp  ${((weather.main.tempMax) -272.15).round().toString()} C', style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.redAccent,
      fontSize: 18,),),
      Text("Wind speed ${weather.wind.speed.toString()} mph", style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.redAccent,
        fontSize: 18,),),
      Text("Humidity ${weather.main.humidity.toString()} %", style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.redAccent,
              fontSize: 18,),),
          ],),
        );});
}) ,


        ],
      ),

      ));
     }

  }



