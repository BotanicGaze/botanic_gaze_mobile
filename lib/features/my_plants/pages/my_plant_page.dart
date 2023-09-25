import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/features/my_plants/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class MyPlantsPage extends StatefulWidget {
  const MyPlantsPage({super.key});

  @override
  State<MyPlantsPage> createState() => _MyPlantsPageState();
}

class _MyPlantsPageState extends State<MyPlantsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: const Text('My plant'),
        centerTitle: false,
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize:
                  Size(Dimens.d54.responsive(), Dimens.d38.responsive()),
              textStyle: Theme.of(context).textTheme.bodySmall,
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.d16.responsive(),
                vertical: Dimens.d8.responsive(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.d32.responsive()),
              ),
            ),
            onPressed: () {},
            child: const Text('Add plant'),
          ),
          SizedBox(
            width: Dimens.d16.responsive(),
          )
        ],
      ),
      body: const MyPlantListView(),
    );
  }
}
