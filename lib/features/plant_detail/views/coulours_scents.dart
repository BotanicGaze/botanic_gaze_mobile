import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';

class ColorsScents extends StatelessWidget {
  const ColorsScents({super.key, this.plantDetailModel});

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
            'Colour & scent',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTitleWidget(
                  imagePath: AppIcons.iconSeasonOfInterest,
                  title: 'Season of interest',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(
                      plantDetailModel?.seasonOfInterest?.length ?? 0, (index) {
                    final data = plantDetailModel?.seasonOfInterest?[index];
                    return Chip(
                      padding: EdgeInsets.zero,
                      avatar: Image.asset(data?.image ?? ''),
                      label: Text(data?.title ?? ''),
                    );
                  }),
                ),
              ],
            ),
          ),
          _colourScentWidget(
            context,
            title: 'Spring',
            attributeData: plantDetailModel?.colourWithAttributeSpring ?? [],
            index: 0,
          ),
          _colourScentWidget(
            context,
            title: 'Summer',
            attributeData: plantDetailModel?.colourWithAttributeSummer ?? [],
            index: 1,
          ),
          _colourScentWidget(
            context,
            title: 'Autumn',
            attributeData: plantDetailModel?.colourWithAttributeAutumn ?? [],
            index: 2,
          ),
          _colourScentWidget(
            context,
            title: 'Winter',
            attributeData: plantDetailModel?.colourWithAttributeWinter ?? [],
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _colourScentWidget(
    BuildContext context, {
    required String title,
    required List<ColourWithAttribute> attributeData,
    required int index,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d8.responsive(),
        horizontal: Dimens.d8.responsive(),
      ),
      decoration: BoxDecoration(
        color: index.isEven ? Theme.of(context).colorScheme.secondary : null,
        borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(width: Dimens.d8.responsive()),
            Expanded(
              flex: 7,
              child: Wrap(
                spacing: Dimens.d8.responsive(),
                runSpacing: Dimens.d8.responsive(),
                children: List.generate(attributeData.length, (index) {
                  final data = attributeData[index];
                  return Chip(
                    avatar: Image.asset(
                      data.attributeType?.image ?? '',
                      color: data.colour?.color,
                    ),
                    label: Text(data.attributeType?.title ?? ''),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
