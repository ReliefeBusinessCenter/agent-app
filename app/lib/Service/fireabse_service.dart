import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseService {
  static Future uploadFile(File? _photo, String folderName) async {
    if (_photo == null) return;
    final fileName = basename(_photo.path);
    final destination = 'files/$fileName';

    try {
      final ref =
          FirebaseStorage.instance.ref(destination).child('$folderName/');
      await ref.putFile(_photo);
    } catch (e) {
      throw('$e');
    }
  }
}
