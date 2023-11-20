import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MyPlantItemWidget extends StatelessWidget {
  const MyPlantItemWidget({
    required this.item,
    super.key,
  });

  final MyPlantModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(ScreenPaths.myPlantDetail, extra: item);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
        child: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                width: Dimens.d75.responsive(),
                height: Dimens.d75.responsive(),
                child: CachedImageWidget(
                  borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
                  fit: BoxFit.cover,
                  imageUrl: item.plantInfo?.featureImage ?? '',
                ),
              ),
              SizedBox(
                width: Dimens.d8.responsive(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Dimens.d4.responsive()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (item.plantInfo?.botanicalName ?? '').parseHtmlString(),
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
