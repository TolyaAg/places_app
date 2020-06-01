import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _storedImage = image;
    });
    if (image == null) return;
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    final imageName = path.basename(image.path);
    final savedImage = await image.copy(path.join(appDir.path, imageName));
    widget.onSelectImage(savedImage);
  }

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
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
