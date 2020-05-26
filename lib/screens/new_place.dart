import 'package:flutter/material.dart';
import 'package:placesapp/widgets/image_input.dart';

class NewPlaceScreen extends StatefulWidget {
  static const routeName = '/new-place';
  @override
  _NewPlaceScreenState createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  final _titleController = TextEditingController();

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
                  SizedBox(height: 10,),
                  ImageInput(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
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
