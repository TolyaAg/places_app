import 'dart:io';

import 'package:flutter/foundation.dart';

class Location {
  final double latitude;
  final double longitude;
  final String address;

  Location({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });

  Place.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'],
          title: map['title'],
          image: File(map['image']),
          location: null,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image.path,
    };
  }
}
