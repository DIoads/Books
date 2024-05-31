import 'dart:io';

abstract class ImageDataSource {
  Future<void> uploadImage({File? image});
}
