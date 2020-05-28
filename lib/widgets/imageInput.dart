import "dart:io";
import "package:flutter/material.dart";
import "package:path/path.dart" as path;
import 'package:image_picker/image_picker.dart';
import "package:path_provider/path_provider.dart" as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(
    this.onSelectImage
  );

  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _catchPicture() async {
    File avatarPictureFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 400
    );

    if (avatarPictureFile == null) {
      avatarPictureFile = File("assets/images/dummyUserAvatar.png"); //This won't work

      widget.onSelectImage(avatarPictureFile);

      return;
    }

    setState(() {
      _storedImage = avatarPictureFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(avatarPictureFile.path);
    final savedAvatar = await avatarPictureFile.copy("${appDir.path}/$fileName");

    widget.onSelectImage(savedAvatar);
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 4,
              color: Colors.blue
            )
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: _storedImage != null ?
            Image.file(
              _storedImage,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ) :
            Image.asset(
              "assets/images/placeholderAvatar.png",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            )
          )
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _catchPicture,
            icon: Icon(
              Icons.camera_alt
            ),
            label: Text("Upload a Picture")
          )
        )
      ]
    );
  }
}