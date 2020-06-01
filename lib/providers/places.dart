import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:placesapp/helpers/db_helper.dart';

import 'package:placesapp/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => List.of(_items);

  void addPlace(String title, File image) {
    final place = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );
    _items.add(place);
    notifyListeners();
    DBHelper.insert('user_places', place.toMap());
  }

  Future<void> getPlaces() async {
    final data = await DBHelper.getData('user_places');
    _items = data.map((e) => Place.fromMap(e)).toList();
    notifyListeners();
  }
}
