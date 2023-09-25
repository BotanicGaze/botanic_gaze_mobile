import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/navigation/navigation_contains.dart';
import 'package:flutter/material.dart';

class MyPlantEmptyView extends StatelessWidget {
  const MyPlantEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.imageMyPlantEmpty),
          const Text(
            "Let's add your plant here, and enjoy hassle-free plant care scheduling",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimens.d16.responsive()),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                context.pushNamed(NavigationContains.scanPage);
              },
              child: const Text('Identify'),
            ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                context.pushNamed(NavigationContains.searchPage);
              },
              child: const Text('Search plant'),
            ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
        ],
      ),
    );
  }
}
