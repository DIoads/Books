import 'package:book/domain/entities/user_entity.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          body: const CardExample()),
    );
  }
}

class CardExample extends ConsumerStatefulWidget {
  const CardExample({super.key});

  @override
  CardExampleState createState() => CardExampleState();
}

class CardExampleState extends ConsumerState<CardExample> {
  @override
  Widget build(BuildContext context) {
    // final BookEntity book = ref.read(bookNotifierProvider);
    UserEntity user = UserEntity(age: '23', username: 'Jose');
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
          // Los bordes del contenido del card se cortan usando BorderRadius
          borderRadius: BorderRadius.circular(30),

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.625,
                  height: height * 0.625,
                  //height: 500,
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(displayText: user.getUsername),
                        CustomText(displayText: user.getAge),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.displayText,
  });

  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Text(displayText);
  }
}
