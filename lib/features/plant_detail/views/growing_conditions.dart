import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';

class GrowingConditions extends StatelessWidget {
  const GrowingConditions({super.key, this.plantDetailModel});

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
            'Growing conditions',
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
                  imagePath: AppIcons.iconSoil,
                  title: 'Soil',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(
                      plantDetailModel?.soilType?.length ?? 0, (index) {
                    final data = plantDetailModel?.soilType?[index];
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
          RowInfoData(
            title: 'Moisture',
            content: plantDetailModel?.moisture
                    ?.map((e) => e.title)
                    .toSet()
                    .toList()
                    .join(', ') ??
                '',
            index: 0,
          ),
          RowInfoData(
            title: 'Ph',
            content: plantDetailModel?.ph
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
          //         imagePath: AppIcons.iconMoisture,
          //         title: 'Moisture',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Text(
          // plantDetailModel?.ph
          //         ?.map((e) => e.title)
          //         .toSet()
          //         .toList()
          //         .join(', ') ??
          //     '',
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       IconTitleWidget(
          //         imagePath: AppIcons.iconPh,
          //         title: 'Ph',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Text(
          //         plantDetailModel?.ph
          //                 ?.map((e) => e.title)
          //                 // .toSet()
          //                 .toList()
          //                 .join(', ') ??
          //             '',
          //       ),
          //       // SizedBox(
          //       //   width: double.infinity,
          //       //   height: Dimens.d40.responsive(),
          //       //   child: Row(
          //       //     children: List.generate(
          //       //       PHLevelX.colors.length,
          //       //       (index) => Expanded(
          //       //         child: Padding(
          //       //           padding: EdgeInsets.symmetric(
          //       //             horizontal: Dimens.d3.responsive(),
          //       //           ),
          //       //           child: Opacity(
          //       //             opacity: plantDetailModel?.ph?.any(
          //       //                       (e) => e.id == index,
          //       //                     ) ??
          //       //                     false
          //       //                 ? 1
          //       //                 : 0.25,
          //       //             child: Column(
          //       //               children: [
          //       //                 Text(
          //       //                   index.toString(),
          //       //                   style: Theme.of(context)
          //       //                       .textTheme
          //       //                       .bodySmall
          //       //                       ?.copyWith(
          //       //                         fontSize: Dimens.d10.responsive(),
          //       //                       ),
          //       //                 ),
          //       //                 Expanded(
          //       //                   child: Container(
          //       //                     decoration: BoxDecoration(
          //       //                       color: PHLevelX.colors[index],
          //       //                       borderRadius: BorderRadius.circular(
          //       //                         Dimens.d14.responsive(),
          //       //                       ),
          //       //                     ),
          //       //                   ),
          //       //                 ),
          //       //               ],
          //       //             ),
          //       //           ),
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ),
          //       // )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
