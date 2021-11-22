import 'dart:io';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadIDImage extends StatefulWidget {
  final Function(File image) pickImage;
  const UploadIDImage({required this.pickImage, Key? key}) : super(key: key);

  @override
  _UploadIDImageState createState() => _UploadIDImageState();
}

class _UploadIDImageState extends State<UploadIDImage> {
  File? file;
  final _pickerImage = ImagePicker();
  _uploadImage() async {
    try {
      final pickedFile =
          await _pickerImage.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      setState(() {
        file = File(pickedFile.path);
      });
      // print("Uploaded File Image: ${photoController.text}");
      // registerBloc.add(AddImage(image: photoController.text));
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        await _uploadImage();
        if (file != null) widget.pickImage(file!);
      },
      child: Container(
        height: size.width * 0.5,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: lightColor,
        ),
        child: file == null
            ? Container(
                child: Center(
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: primaryColor,
                  size: size.width * 0.2,
                ),
              ))
            : Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: lightColor,
                  image: DecorationImage(
                    image: FileImage(
                      file!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}
