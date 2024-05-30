import 'package:book/domain/entities/book_entity.dart';
import 'package:book/presentation/providers/book_provider.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookScreen extends StatelessWidget with CustomAppBar {
  final String name = "Libro";

  const BookScreen({super.key});

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
    final BookEntity book = ref.read(bookNotifierProvider);
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
                  child: Image.network(book.getBookImage),
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(displayText: book.getTitle),
                        CustomText(displayText: book.getAuthor),
                        CustomText(
                            displayText: 'Ranking actual: \t${book.getRank}'),
                        CustomText(displayText: book.getContributor),
                        CustomText(
                            displayText:
                                'Descripción: \t${book.getDescription}')
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
