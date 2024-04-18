import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HowToGrowView extends StatelessWidget {
  const HowToGrowView({super.key, this.plantDetailModel});
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
            'How to grow',
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
                  imagePath: AppIcons.iconCultivation,
                  title: 'Cultivation',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text(
                  (plantDetailModel?.cultivation ?? '').parseHtmlString(),
                  // onLinkTap: (url, attributes, element) {
                  //   if (url?.isNotEmpty ?? false) {
                  //     IntentUtils.openBrowserURL(
                  //       url: Uri.parse(
                  //         url ?? '',
                  //       ),
                  //       inApp: true,
                  //     );
                  //   }
                  // },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTitleWidget(
                  imagePath: AppIcons.iconPropagation,
                  title: 'Propagation',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text((plantDetailModel?.propagation ?? '').parseHtmlString()),
                // Html(
                //   data: plantDetailModel?.propagation ?? '',
                //   onLinkTap: (url, attributes, element) {
                //     if (url?.isNotEmpty ?? false) {
                //       IntentUtils.openBrowserURL(
                //         url: Uri.parse(
                //           url ?? '',
                //         ),
                //         inApp: true,
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       IconTitleWidget(
          //         imagePath: AppIcons.iconSuggestedPlantingLocation,
          //         title: 'Suggested planting locations and garden types',
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       SizedBox(height: Dimens.d8.responsive()),
          //       Html(
          //         data: plantDetailModel?.propagation ?? '',
          //       )
          //     ],
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTitleWidget(
                  imagePath: AppIcons.iconPruning,
                  title: 'Pruning',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text((plantDetailModel?.pruning ?? '').parseHtmlString()),

                // Html(
                //   data: plantDetailModel?.pruning ?? '',
                //   onLinkTap: (url, attributes, element) {
                //     if (url?.isNotEmpty ?? false) {
                //       IntentUtils.openBrowserURL(
                //         url: Uri.parse(
                //           url ?? '',
                //         ),
                //         inApp: true,
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTitleWidget(
                  imagePath: AppIcons.iconPestsDiseases,
                  title: 'Pests & Diseases',
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text(
                  'Pests',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (plantDetailModel?.pestResistance ?? '').parseHtmlString(),
                ),

                // Html(
                //   data: plantDetailModel?.pestResistance ?? '',
                //   onLinkTap: (url, attributes, element) {
                //     if (url?.isNotEmpty ?? false) {
                //       IntentUtils.openBrowserURL(
                //         url: Uri.parse(
                //           url ?? '',
                //         ),
                //         inApp: true,
                //       );
                //     }
                //   },
                // ),
                SizedBox(height: Dimens.d8.responsive()),
                Text(
                  'Diseases',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (plantDetailModel?.diseaseResistance ?? '').parseHtmlString(),
                ),
                // Html(
                //   data: plantDetailModel?.diseaseResistance ?? '',
                //   onLinkTap: (url, attributes, element) {
                //     if (url?.isNotEmpty ?? false) {
                //       IntentUtils.openBrowserURL(
                //         url: Uri.parse(
                //           url ?? '',
                //         ),
                //         inApp: true,
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
