import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({super.key});

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.d16.responsive()),
        child: Column(
          children: [
            Text(
              'Using ${getIt<AppInfo>().appName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ExpandableNotifier(
              initialExpanded: true,
              child: ExpandablePanel(
                header: buildCollapsed1(),
                collapsed: Container(),
                expanded: buildExpanded1(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildCollapsed1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Expandable',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildExpanded1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Expandable',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '3 Expandable widgets',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
