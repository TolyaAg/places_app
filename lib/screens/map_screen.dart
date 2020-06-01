import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  YandexMapController _controller;

  void _save() {
    Navigator.of(context).pop(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: <Widget>[
          IconButton(
            onPressed: _save,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: YandexMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
      ),
    );
  }
}
