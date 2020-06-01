const API_KEY = 'AIzaSyB68e4WHW6zm5UJyWyBh2irBcaTZpcB8Hw';

class LocationHelper {
  static String generatePreviewImage({double latitude, double longitude}) {
    return 'https://static-maps.yandex.ru/1.x/?ll=$latitude,$longitude&size=650,450&z=15&l=map&pt=$latitude,$longitude,pmwtm99';
  }
}
