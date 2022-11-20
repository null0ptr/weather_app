import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api_call.dart';
import 'package:weather_app/views/additional_info.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:weather_app/model/weather_model.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf1f1f1),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 0.0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController cityName = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: cityName,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a City name',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  Navigator.push(context, InfoPage(cityName.text));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoPage extends MaterialPageRoute<String> {
  InfoPage(dynamic cityName)
      : super(builder: (BuildContext context) {
          WeatherApi client = WeatherApi();
          Weather? data;

          Future<void> getData() async {
            data = await client.getCurrentWeather(cityName);
          }

          return Scaffold(
              backgroundColor: const Color(0xFFf1f1f1),
              // backgroundColor: Colors.black87,
              appBar: AppBar(
                backgroundColor: Colors.black45,
                elevation: 0.0,
                title: const Text(
                  "Weather App",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(height: 60.0),
                        Text(
                          "Invalid Input",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        currentWeather("${data?.temp}", "${data?.cityName}",
                            "${data?.main}", "${data!.timezone}"),
                        const SizedBox(height: 60.0),
                        const Text(
                          "Additional Information",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        additionalInfo(
                            "${data!.wind}",
                            "${data!.humidity}",
                            "${data!.pressure}",
                            "${data!.feelsLike}",
                            "${data!.sunrise}",
                            "${data!.sunset}",
                            "${data!.timezone}")
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                },
              ));
        });
}
