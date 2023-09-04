import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';

class SunlightPosition extends StatelessWidget {
  const SunlightPosition({super.key, this.plantDetailModel});
  final PlantDetailModel? plantDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sunlight & Position',
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
                const IconTitleWidget(
                  imagePath: AppIcons.iconSun,
                  title: 'Sunlight',
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(
                      plantDetailModel?.sunlight?.length ?? 0, (index) {
                    final data = plantDetailModel?.sunlight?[index];
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
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       IconTitleWidget(
          //         imagePath: AppIcons.iconAspect,
          //         title: 'Aspect',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Text(
          //         plantDetailModel?.aspect
          //                 ?.map((e) => e.title)
          //                 .toList()
          //                 .join(', ') ??
          //             '',
          //       ),
          //     ],
          //   ),
          // ),
          RowInfoData(
            title: 'Aspect',
            content: plantDetailModel?.aspect
                    ?.map((e) => e.title)
                    .toSet()
                    .toList()
                    .join(', ') ??
                '',
            index: 0,
          ),
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       IconTitleWidget(
          //         imagePath: AppIcons.iconExposure,
          //         title: 'Exposure',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Text(
          //         plantDetailModel?.exposure
          //                 ?.map((e) => e.title)
          //                 .toList()
          //                 .join(', ') ??
          //             '',
          //       ),
          //     ],
          //   ),
          // ),
          RowInfoData(
            title: 'Exposure',
            content: plantDetailModel?.exposure
                    ?.map((e) => e.title)
                    .toSet()
                    .toList()
                    .join(', ') ??
                '',
            index: 1,
          ),
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       IconTitleWidget(
          //         imagePath: AppIcons.iconHardiness,
          //         title: 'Hardiness',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Text(
          //         plantDetailModel?.hardinessLevel.toString() ?? '',
          //       ),
          //     ],
          //   ),
          // ),
          RowInfoData(
            title: 'Hardiness',
            content: plantDetailModel?.hardinessLevel.toString() ?? '',
            index: 2,
          ),
        ],
      ),
    );
  }
}
