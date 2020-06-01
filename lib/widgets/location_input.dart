import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:placesapp/helpers/location_helper.dart';
import 'package:placesapp/screens/map_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImage;

  Future<void> _getCurrentUserLocation() async {
    final location = await Location().getLocation();
    setState(() {
      _previewImage = LocationHelper.generatePreviewImage(
        latitude: location.latitude,
        longitude: location.longitude,
      );
    });
  }

  Future<void> _selectLocation() async {
    final controller = await Navigator.of(context).push<YandexMapController>(
      MaterialPageRoute(
        builder: (_) => MapScreen(),
      ),
    );
    final point = await controller.getTargetPoint();
    setState(() {
      _previewImage = LocationHelper.generatePreviewImage(
        latitude: point.latitude,
        longitude: point.longitude,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImage == null
              ? const Text(
                  'No location chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImage,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: const Icon(
                Icons.map,
              ),
              label: const Text('Select Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _selectLocation,
            ),
          ],
        )
      ],
    );
  }
}
