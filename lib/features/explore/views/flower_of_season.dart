import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class FlowerOfSeasonView extends StatelessWidget {
  const FlowerOfSeasonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<ExploreBloc, ExploreState, SeasonOfInterest>(
          selector: (state) {
            return state.currentSeason;
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(
                Dimens.d16.responsive(),
              ),
              child: Text(
                'Flowers of interest in the ${state.title}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: AppFontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            );
          },
        ),
        BlocSelector<ExploreBloc, ExploreState, List<PlantSearchResponse>>(
          selector: (state) {
            return state.flowerOfSeason ?? [];
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: IntrinsicHeight(
                    child: Row(
                      children: List.generate(state.length, (index) {
                        final data = state[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: Dimens.d16.responsive(),
                            left: index == 0 ? Dimens.d16.responsive() : 0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                ScreenPaths.plantDetailPage,
                                pathParameters: {'id': data.id.toString()},
                              );
                            },
                            child: SizedBox(
                              width: ScreenUtil().screenWidth * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: CachedImageWidget(
                                      imageUrl:
                                          'https://apps.rhs.org.uk/plantselectorimages/detail/${data.image}',
                                      borderRadius: BorderRadius.circular(
                                        Dimens.d8.responsive(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // const Spacer(),
                                  SizedBox(height: Dimens.d4.responsive()),
                                  Padding(
                                    padding:
                                        EdgeInsets.all(Dimens.d4.responsive()),
                                    child: Text(
                                      (data.botanicalName ?? '')
                                          .parseHtmlString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
