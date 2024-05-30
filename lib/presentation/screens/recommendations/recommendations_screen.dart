import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/providers/overview_response_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendationsScreen extends StatelessWidget with CustomAppBar {
  final String name = "Recomendaciones";

  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SizedBox(
      width: width,
      height: height,
      child: Scaffold(
          appBar: appBarWithOutReturnButton(
              title: name, backgroundcolor: colors.onPrimary),
          body: const RecommendationsScreenView()),
    );
  }
}

class RecommendationsScreenView extends ConsumerStatefulWidget {
  const RecommendationsScreenView({
    super.key,
  });
  @override
  RecommendationsScreenViewState createState() =>
      RecommendationsScreenViewState();
}

class RecommendationsScreenViewState
    extends ConsumerState<RecommendationsScreenView> {
  @override
  Widget build(BuildContext context) {
    List<ListElementEntity> resultsList =
        ref.read(overviewResponseNotifierProvider).getResults.getLists;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListList(
            resultsList: resultsList,
          ),
          const ButtonsRow()
        ],
      ),
    );
  }
}
