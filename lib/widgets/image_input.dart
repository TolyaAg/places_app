import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.contain,
                )
              : Text('No image'),
          alignment: Alignment.center,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
