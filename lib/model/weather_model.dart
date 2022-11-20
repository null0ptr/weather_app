class Weather {
  dynamic cityName;
  dynamic temp;
  dynamic wind;
  dynamic humidity;
  dynamic pressure;
  dynamic feelsLike;
  dynamic icon;
  dynamic main;
  dynamic timezone;
  dynamic sunrise;
  dynamic sunset;
  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.pressure,
      this.feelsLike,
      this.icon,
      this.main,
      this.timezone,
      this.sunrise,
      this.sunset});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feelsLike = json["main"]["feels_like"];
    icon = json["weather"][0]["icon"];
    main = json["weather"][0]["main"];
    timezone = json["timezone"];
    sunrise = json["sys"]["sunrise"];
    sunset = json["sys"]["sunset"];
  }
}
