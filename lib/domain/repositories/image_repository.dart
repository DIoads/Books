import 'dart:io';

abstract class ImageRepository {
  Future<String> uploadImage({required File image, required String uid});
}
