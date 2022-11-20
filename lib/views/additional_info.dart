import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0);
Widget additionalInfo(String wind, String humidity, String pressure,
    String feelsLike, String sunrise, String sunset, String timezone) {
  int v = int.parse(timezone);
  dynamic sunr = DateFormat()
      .add_jm()
      .format(DateTime.fromMillisecondsSinceEpoch(
          (int.parse(sunrise) + (v - DateTime.now().timeZoneOffset.inSeconds)) *
              1000))
      .toString();
  dynamic suns = DateFormat()
      .add_jm()
      .format(DateTime.fromMillisecondsSinceEpoch(
          (int.parse(sunset) + (v - DateTime.now().timeZoneOffset.inSeconds)) *
              1000))
      .toString();
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wind",
                  style: titleFont,
                ),
                const SizedBox(height: 18.0),
                Text("Pressure", style: titleFont),
                const SizedBox(height: 18.0),
                Text(
                  "Humidity",
                  style: titleFont,
                ),
                const SizedBox(height: 18.0),
                Text("Feels Likes", style: titleFont),
                const SizedBox(height: 18.0),
                Text(
                  "Sunrise",
                  style: titleFont,
                ),
                const SizedBox(height: 18.0),
                Text("Sunset", style: titleFont)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind km/h",
                  style: infoFont,
                ),
                const SizedBox(height: 18.0),
                Text("$pressure mb", style: infoFont),
                const SizedBox(height: 18.0),
                Text(
                  "$humidity%",
                  style: infoFont,
                ),
                const SizedBox(height: 18.0),
                Text("$feelsLike℃", style: infoFont),
                const SizedBox(height: 18.0),
                Text(
                  sunr,
                  style: infoFont,
                ),
                const SizedBox(height: 18.0),
                Text(suns, style: infoFont)
              ],
            ),
          ],
        )
      ],
    ),
  );
}
