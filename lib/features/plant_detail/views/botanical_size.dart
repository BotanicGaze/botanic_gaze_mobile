import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';

class BotanicalSize extends StatelessWidget {
  const BotanicalSize({super.key, this.plantDetailModel});

  final PlantDetailModel? plantDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          RowInfoData(
            title: 'Ultimate height',
            content: plantDetailModel?.height ?? '',
            index: 0,
          ),
          RowInfoData(
            title: 'Time to ultimate height',
            content: plantDetailModel?.timeToFullHeight
                    ?.map((e) => e.title)
                    .toSet()
                    .toList()
                    .join(', ') ??
                '',
            index: 1,
          ),
          RowInfoData(
            title: 'Ultimate spread',
            content: plantDetailModel?.spread ?? '',
            index: 2,
          ),
        ],
      ),
    );
  }
}
