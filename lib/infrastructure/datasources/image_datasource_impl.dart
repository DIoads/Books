import 'dart:io';

import 'package:book/domain/datasources/image_datasource.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<String> uploadImage({required File image, required String uid}) async {
    final ref = FirebaseStorage.instance.ref('images/').child(uid);
    await ref.putFile(image);
    String url = await ref.getDownloadURL();
    return url;
  }
}
