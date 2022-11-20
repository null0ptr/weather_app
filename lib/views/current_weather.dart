import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget currentWeather(
    String temp, String location, String main, String timezone) {
  int v = int.parse(timezone);
  DateTime d = DateTime.now()
      .add(Duration(seconds: v - DateTime.now().timeZoneOffset.inSeconds));
  String all = DateFormat('EEEE, MMMM d, y,').add_jm().format(d);
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Weather of ",
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            Text(
              location,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          all,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          "$temp℃",
          style: const TextStyle(
            fontSize: 40.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          main,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    ),
  );
}
