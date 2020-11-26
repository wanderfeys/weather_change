import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';

const kApiKey = '569e683994a658f8661ec9943f92e4ba';

const kWeatherURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelp networkHelp = new NetworkHelp(
        "$kWeatherURL?&q=$cityName&appid=$kApiKey&&units=metric");
    var weatherData = await networkHelp.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelp networkHelp = new NetworkHelp(
        "$kWeatherURL?lat=${location.latitude}&lon=${location.longtitude}&appid=$kApiKey&units=metric");
    var weatherData = await networkHelp.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
