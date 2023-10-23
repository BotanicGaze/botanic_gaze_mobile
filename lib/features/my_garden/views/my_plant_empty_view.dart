import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

class MyPlantEmptyView extends StatelessWidget {
  const MyPlantEmptyView({
    required this.pagingController,
    super.key,
    this.error,
  });

  // final String? message;
  final RemoteException? error;
  final CommonPagingController<MyPlantModel> pagingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.imageMyPlantEmpty),
          Text(
            error?.generalServerMessage ??
                "Let's add your plant here, and enjoy hassle-free plant care scheduling",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimens.d16.responsive()),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: pagingController.refresh,
              child: const Text('Reload page'),
            ),
          ),
          // SizedBox(height: Dimens.d16.responsive()),
          // SizedBox(
          //   width: double.infinity,
          //   child: TextButton(
          //     onPressed: () {
          //       context.pushNamed(NavigationContains.searchPage);
          //     },
          //     child: const Text('Search plant'),
          //   ),
          // ),
          // SizedBox(height: Dimens.d16.responsive()),
        ],
      ),
    );
  }
}
