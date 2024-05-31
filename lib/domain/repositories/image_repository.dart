import 'dart:io';

abstract class ImageRepository {
  Future<void> uploadImage({required File image, required String uid});
}
