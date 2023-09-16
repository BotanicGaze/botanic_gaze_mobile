import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExplorePlantTypes extends StatelessWidget {
  const ExplorePlantTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(
            Dimens.d16.responsive(),
          ),
          child: Text(
            'Plant types',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        SizedBox(
          height: Dimens.d220.responsive(),
          child: MasonryGridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.d16.responsive(),
            ),
            itemCount: PlantType.values.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Image.asset(
                    PlantType.values[index].imagePath,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Dimens.d12.responsive(),
                      right: Dimens.d24.responsive(),
                    ),
                    child: Text(
                      PlantType.values[index].titleWithNewLine,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
