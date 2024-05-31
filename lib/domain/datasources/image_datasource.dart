import 'dart:io';

abstract class ImageDataSource {
  Future<void> uploadImage({required File image, required String uid});
}
