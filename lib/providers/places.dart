import 'package:flutter/foundation.dart';

import 'package:placesapp/models/place.dart';

class Places with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places => List.of(_places);
}