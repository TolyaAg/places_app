import 'dart:io';

import 'package:flutter/material.dart';
import 'package:placesapp/widgets/image_input.dart';
import 'package:placesapp/widgets/location_input.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

class NewPlaceScreen extends StatefulWidget {
  static const routeName = '/new-place';
  @override
  _NewPlaceScreenState createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  final _titleController = TextEditingController();
  File _selectedImage;

  void _handleSelectImage(File selectedImage) {
    _selectedImage = selectedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _selectedImage == null) {
      return;
    }
    context
        .read<PlacesProvider>()
        .addPlace(_titleController.text, _selectedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  SizedBox(height: 10),
                  ImageInput(_handleSelectImage),
                  SizedBox(height: 10),
                  LocationInput(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: const Text('Add Place'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
