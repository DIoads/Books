import 'package:book/presentation/providers/color_provider.dart';
import 'package:book/presentation/screens/recommended/recommended_screen.dart';
import 'package:book/presentation/widgets/category/Category.dart';

import 'package:flutter/material.dart';

class Paginas extends StatefulWidget {
  @override
  _PaginasState createState() => _PaginasState();
}

class _PaginasState extends State<Paginas> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return AnimatedPadding(
            padding: _currentPage == index
                ? EdgeInsets.all(0)
                : EdgeInsets.symmetric(vertical: 40),
            duration: Duration(milliseconds: 200),
            child: AnimatedOpacity(
              opacity: _currentPage == index ? 1 : 0.5,
              duration: Duration(milliseconds: 200),
              child: RecommendedScreen(
                  // category: categoryList[index],
                  ),
            ),
          );
        },
        onPageChanged: (newPage) {
          setState(() {
            _currentPage = newPage;
          });
          /* Provider.of<ColorProvider>(context, listen: false)
              .changeColors(newPage);*/
        },
      ),
    );
  }
}
