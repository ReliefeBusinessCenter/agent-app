import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseService {
  static Future<String?> uploadFile(String? _photo, String folderName) async {
    if (_photo == null) return null;
    final fileName = basename(_photo);
    final destination = 'files/$fileName';

    try {
      final ref =
          FirebaseStorage.instance.ref(destination).child('$folderName/');
      await ref.putFile(File(_photo));
      return ref.fullPath;
    } catch (e) {
      throw ('$e');
    }
  }

  static Future<String> loadImage(String image, String folderName) async {
    print("I am inside the firebase service");
    Reference ref = FirebaseStorage.instance.ref().child("$folderName/$image");
    var url = await ref.getDownloadURL();
    print("URL: $url");
    return url;
  }
}
