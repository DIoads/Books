import 'package:book/domain/repositories/image_repository.dart';
import 'package:book/infrastructure/repositories/image_repository_impl.dart';
import 'package:book/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

mixin ImgPicker {
  void showPicker(
      {required BuildContext context,
      required String uid,
      required UserNotifier userNotifier}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery(uid: uid, userNotifier: userNotifier);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera(uid: uid, userNotifier: userNotifier);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery(
      {required String uid, required UserNotifier userNotifier}) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile(uid: uid, userNotifier: userNotifier);
    }
  }

  Future imgFromCamera(
      {required String uid, required UserNotifier userNotifier}) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile(uid: uid, userNotifier: userNotifier);
    }
  }

  Future uploadFile(
      {required String uid, required UserNotifier userNotifier}) async {
    ImageRepository imageRepository = ImageRepositoryImpl();
    if (_photo == null) return;

    try {
      String imgUrl =
          await imageRepository.uploadImage(image: _photo!, uid: uid);
      await userNotifier.updateImage(imgUrl: imgUrl);
    } catch (e) {
      // print(e);
    }
  }
}
