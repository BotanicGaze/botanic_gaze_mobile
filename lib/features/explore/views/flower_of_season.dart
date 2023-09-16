import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class FlowerOfSeasonView extends StatelessWidget {
  const FlowerOfSeasonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExploreBloc, ExploreState, List<PlantSearchResponse>>(
      selector: (state) {
        return state.flowerOfSeason ?? [];
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                Dimens.d16.responsive(),
              ),
              child: Text(
                'Flowers of interest in the fall',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: AppFontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
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
                              padding: EdgeInsets.all(Dimens.d4.responsive()),
                              child: Text(
                                (data.botanicalName ?? '').parseHtmlString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
            // SizedBox(
            //   height: Dimens.d220.responsive(),
            //   child: MasonryGridView.count(
            //     scrollDirection: Axis.horizontal,
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 8,
            //     crossAxisSpacing: 8,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: Dimens.d16.responsive(),
            //     ),
            //     itemCount: PlantType.values.length,
            //     itemBuilder: (context, index) {
            //       return Stack(
            //         alignment: AlignmentDirectional.centerStart,
            //         children: [
            //           Image.asset(
            //             PlantType.values[index].imagePath,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.only(
            //               left: Dimens.d12.responsive(),
            //               right: Dimens.d24.responsive(),
            //             ),
            //             child: Text(
            //               PlantType.values[index].titleWithNewLine,
            //               style:
            //                   Theme.of(context).textTheme.labelSmall?.copyWith(
            //                         color: AppColors.white,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
