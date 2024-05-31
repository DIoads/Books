import 'dart:io';

import 'package:book/domain/datasources/image_datasource.dart';
import 'package:book/domain/repositories/image_repository.dart';
import 'package:book/infrastructure/datasources/image_datasource_impl.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource = ImageDataSourceImpl();
  @override
  Future<String> uploadImage({required File image, required String uid}) async {
    return await _imageDataSource.uploadImage(image: image, uid: uid);
  }
}
