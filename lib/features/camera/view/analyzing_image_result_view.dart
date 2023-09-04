import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class AnalyzingImageResultView extends StatefulWidget {
  const AnalyzingImageResultView({super.key, this.identifyData});
  final PlantIdentifyModel? identifyData;

  @override
  State<AnalyzingImageResultView> createState() =>
      _AnalyzingImageResultViewState();
}

class _AnalyzingImageResultViewState extends State<AnalyzingImageResultView> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.identifyData?.plants?.length ?? 0,
      itemBuilder: (context, index) {
        final plant = widget.identifyData?.plants?[index];
        final size = MediaQuery.of(context).size;
        final isExpanded = pageIndex == index;
        final borderRadius =
            BorderRadius.all(Radius.circular(Dimens.d8.responsive()));
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.all(8),
              height: isExpanded ? size.height * 0.6 : size.height * 0.4,
              width: isExpanded ? size.height * 0.8 : size.width * 0.7,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 24),
                    blurRadius: 199,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 5.36),
                    blurRadius: 44.45,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: const Offset(0, 1.6),
                    blurRadius: 13.23,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      NavigationContains.plantDetailPage,
                      pathParameters: {'id': plant?.rhsPlantId ?? ''},
                    );
                  },
                  child: Container(
                    height: size.height * 0.15,
                    padding: EdgeInsets.all(Dimens.d8.responsive()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                plant?.providerPlantName ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              '${((plant?.score ?? 0) * 100).toStringAsFixed(2)}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.red.shade700,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(height: Dimens.d8.responsive()),
                        Text(
                          plant?.providerPreferredCommonPlantName.toString() ??
                              '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: isExpanded ? size.height * 0.1 : size.height * 0.15,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    NavigationContains.plantDetailPage,
                    pathParameters: {'id': plant?.rhsPlantId ?? ''},
                  );
                },
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: SizedBox(
                    height: size.height * 0.5,
                    width: size.width * 0.7,
                    child: CachedImageWidget(
                      imageUrl: plant?.featureImage ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      onPageChanged: (index) => setState(() => pageIndex = index),
    );
  }
}
