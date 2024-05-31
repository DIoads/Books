import 'dart:io';

import 'package:book/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends ConsumerWidget {
  final String uid;

  ImagePick({super.key, required this.uid});

  late File? _photo;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);

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
  }

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
    if (_photo == null) return;

    try {
      // userNotifier.updateImage(imgUrl)
    } catch (e) {
      // print(e);
    }
  }
}
