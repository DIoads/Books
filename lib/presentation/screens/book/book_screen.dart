import 'package:book/domain/entities/book_entity.dart';
import 'package:book/presentation/providers/book_provider.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookScreen extends StatelessWidget with CustomAppBar {
  final String name = "Libro";

  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: appBarWithOutReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: const CardExample());
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
    double height = screenSize.height;
    double width = screenSize.width;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: ClipRRect(
        // Los bordes del contenido del card se cortan usando BorderRadius
        borderRadius: BorderRadius.circular(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton.outlined(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back)),
            SizedBox(
              width: width * 0.625,
              //height: 500,
              child: Card(
                child: Wrap(
                  children: [
                    Image.network(book.getBookImage),
                  ],
                ),
              ),
            ),
            CustomText(displayText: book.getTitle),
            CustomText(displayText: book.getAuthor),
            CustomText(displayText: 'Ranking actual: \t${book.getRank}'),
            CustomText(displayText: book.getContributor),
            CustomText(displayText: 'Descripción: \t${book.getDescription}')
          ],
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
