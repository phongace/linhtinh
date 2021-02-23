import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File fileImage;
  List<File> images = <File>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: fileImage != null
              ? buildFileImage()
              : Container(
                  height: 500,
                  child: Center(
                    child: Text(
                      'No Photos',
                      style: TextStyle(fontSize: 30, color: Colors.brown[300]),
                    ),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).iconTheme.color,
        child: Icon(FontAwesomeIcons.fileUpload),
        onPressed: () => _showUploadDialog(),
      ),
    );
  }

  Widget buildFileImage() {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (_, index) {
        File file = images[index];
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: FileImage(file),
              radius: 120,
            ),
            const SizedBox(height: 20),
            Image.file(
              file,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Future<void> _showUploadDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlatButton.icon(
                  minWidth: 200,
                  color: Colors.purple[100],
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {
                    _openCamera();
                    Navigator.pop(context);
                  },
                  icon: Icon(FontAwesomeIcons.cameraRetro),
                  label: Row(
                    children: [
                      const SizedBox(width: 15.0),
                      Text('Open Camera'),
                    ],
                  ),
                ),
                FlatButton.icon(
                  minWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.red[100],
                  onPressed: () {
                    _uploadImage();
                    Navigator.pop(context);
                  },
                  icon: Icon(FontAwesomeIcons.solidFileImage),
                  label: Row(
                    children: [
                      const SizedBox(width: 15.0),
                      Text('Open Gallery'),
                    ],
                  ),
                ),
                FlatButton(
                  minWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.teal[100],
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
        });
  }

  void _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final file = File(pickedFile.path);
    setState(() {
      fileImage = file;
    });
    images.add(fileImage);
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile == null) return;

    final file = File(pickedFile.path);
    setState(() {
      fileImage = file;
    });
    images.add(fileImage);
  }
}
