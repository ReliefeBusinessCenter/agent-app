import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class SavingIdPhotUpload extends StatefulWidget {
  final Function(File image) pickImage;
  final String image;
  const SavingIdPhotUpload(
      {required this.pickImage, required this.image, Key? key})
      : super(key: key);

  @override
  _SavingIdPhotUploadState createState() => _SavingIdPhotUploadState();
}

class _SavingIdPhotUploadState extends State<SavingIdPhotUpload> {
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
            ? CachedNetworkImage(
                imageUrl: "${Ip.ip}/api/users/get/?fileName=${widget.image}",
                imageBuilder: (context, imageProvider) => Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill)),
                ),
                errorWidget: (context, imageProvider, _) => Center(
                  child: Icon(Icons.error),
                ),
                placeholder: (context, imageProvider) => SpinKitCircle(
                  color: primaryColor,
                ),
              )
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
