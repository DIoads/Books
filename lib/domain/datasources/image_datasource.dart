import 'dart:io';

abstract class ImageDataSource {
  Future<String> uploadImage({required File image, required String uid});
}
