import 'package:book/domain/entities/user_entity.dart';
import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class UserInfoScreen extends StatelessWidget with CustomAppBar {
  final String name = "Información del usuario";

  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: Scaffold(
          appBar: appBarWithReturnButton(
              title: name, backgroundcolor: colors.onPrimary),
          body: const UserInfoView()),
    );
  }
}

class UserInfoView extends ConsumerStatefulWidget {
  const UserInfoView({super.key});

  @override
  UserInfoViewState createState() => UserInfoViewState();
}

class UserInfoViewState extends ConsumerState<UserInfoView> with ImgPicker {
  @override
  Widget build(BuildContext context) {
    final UserEntity user = ref.watch(userNotifierProvider);
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);
    final String uid = userNotifier.getUserId();

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        showPicker(
                            context: context,
                            uid: uid,
                            userNotifier: userNotifier);
                      },
                      icon: const Icon(Icons.add_photo_alternate_outlined)),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(user.getImageUrl),
                  ),
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(displayText: user.getUsername),
                          CustomText(displayText: user.getAge),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 200)),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/modifyUserInfo');
                    },
                    child: const Text('Modificar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
