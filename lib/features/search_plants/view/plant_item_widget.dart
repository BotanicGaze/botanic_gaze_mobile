import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PlantItemWidget extends StatelessWidget {
  const PlantItemWidget({
    required this.plantData,
    super.key,
  });
  final PlantSearchResponse plantData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          NavigationContains.plantDetailPage,
          pathParameters: {'id': plantData.id.toString()},
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.d16.responsive(),
          vertical: Dimens.d8.responsive(),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CachedImageWidget(
                imageUrl:
                    'https://apps.rhs.org.uk/plantselectorimages/detail/${plantData.image}',
                width: Dimens.d75.responsive(),
                height: Dimens.d75.responsive(),
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(
                  Dimens.d6.responsive(),
                ),
              ),
              SizedBox(
                width: Dimens.d12.responsive(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      (plantData.botanicalName ?? '').parseHtmlString(),
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      (plantData.entityDescription ?? '').parseHtmlString(),
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Dimens.d12.responsive(),
              ),
              Image.asset(
                AppIcons.iconChevronRight,
                width: Dimens.d24.responsive(),
                height: Dimens.d24.responsive(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
