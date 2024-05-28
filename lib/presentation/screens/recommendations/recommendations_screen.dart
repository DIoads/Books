import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/providers/overview_response_provider.dart';
import 'package:book/presentation/widgets/listViews/list_list_view.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendationsScreen extends StatelessWidget with CustomAppBar {
  final String name = "Recommendations";

  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithOutReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: const RecommendationsScreenView());
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
      child: ListList(
        resultsList: resultsList,
      ),
    );
  }
}
