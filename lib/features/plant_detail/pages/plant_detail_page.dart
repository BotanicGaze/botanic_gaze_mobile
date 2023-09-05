import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/features/plant_detail/views/how_to_grow.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PlantDetailPage extends StatefulWidget {
  const PlantDetailPage({required this.plantId, super.key});
  final int plantId;

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState
    extends BasePageState<PlantDetailPage, PlantDetailBloc> {
  AutoScrollController scrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(GetPlantDetail(widget.plantId));
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<PlantDetailBloc, PlantDetailState>(
      builder: (context, state) {
        return CommonScaffold(
          backgroundColor: Theme.of(context).cardColor,
          // appBar: AppBar(
          //   toolbarHeight: 0,
          // ),
          body: state.plantDetailModel == null
              ? const SizedBox()
              : NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: ScreenUtil().screenWidth * 4 / 3,
                        pinned: true,
                        leading: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimens.d100),
                            ),
                          ),
                          onPressed: () {
                            context.pop();
                          },
                          icon: Image.asset(AppIcons.iconArrowLeft),
                        ),
                        title: Visibility(
                          visible: innerBoxIsScrolled,
                          child: Text(
                            state.plantDetailModel?.botanicalNameUnFormatted ??
                                '',
                          ),
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          background: PageView.builder(
                            itemCount:
                                state.plantDetailModel?.images?.length ?? 0,
                            itemBuilder: (context, index) {
                              final image =
                                  state.plantDetailModel?.images?[index];
                              return GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    NavigationContains.galleryPhotoWrapper,
                                    extra: {
                                      'initial_index': index,
                                      'gallery_images': state
                                          .plantDetailModel?.images
                                          ?.map(
                                            (e) => '${e.baseUrl}' '${e.image}',
                                          )
                                          .toList()
                                    },
                                  );
                                },
                                child: Hero(
                                  tag: '${image?.baseUrl}' '${image?.image}',
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      CachedImageWidget(
                                        imageUrl: '${image?.baseUrl}'
                                            '${image?.image}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      Container(
                                        color: Colors.black.withOpacity(0.5),
                                        padding: EdgeInsets.all(
                                          Dimens.d8.responsive(),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.copyright,
                                              color: AppColors.borderColor,
                                            ),
                                            SizedBox(
                                              width: Dimens.d8.responsive(),
                                            ),
                                            Text(
                                              image?.copyRight ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color:
                                                        AppColors.borderColor,
                                                  ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(Dimens.d16.responsive()),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.plantDetailModel
                                          ?.botanicalNameUnFormatted ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                SizedBox(height: Dimens.d4.responsive()),
                                Text(
                                  'Known as:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(height: Dimens.d4.responsive()),
                                Text(
                                  state.plantDetailModel?.autoCompleteFieldList
                                          ?.join(', ') ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimens.d16.responsive()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              SizedBox(height: Dimens.d8.responsive()),
                              Text(
                                state.plantDetailModel?.entityDescription ?? '',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        BotanicalDetails(
                          plantDetailModel: state.plantDetailModel,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        SunlightPosition(
                          plantDetailModel: state.plantDetailModel,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        GrowingConditions(
                          plantDetailModel: state.plantDetailModel,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        HowToGrowView(
                          plantDetailModel: state.plantDetailModel,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        BotanicalSize(plantDetailModel: state.plantDetailModel),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        ColorsScents(plantDetailModel: state.plantDetailModel),
                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 12,
                        ),
                        const HelpfulContentView(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class CareInstructionView extends StatelessWidget {
  const CareInstructionView({
    super.key,
    this.plantDetailModel,
  });

  final PlantDetailModel? plantDetailModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Care Instruction',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppIcons.iconSoil,
                    width: Dimens.d24.responsive(),
                  ),
                  SizedBox(width: Dimens.d4.responsive()),
                  Text(
                    'Soil',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: Dimens.d6.responsive(),
                  runSpacing: Dimens.d6.responsive(),
                  children: List.generate(
                      plantDetailModel?.soilType?.length ?? 0, (index) {
                    final data = plantDetailModel?.soilType?[index];
                    return Chip(
                      avatar: Image.asset(data?.image ?? ''),
                      label: Text(data?.title ?? ''),
                    );
                  }),
                ),
              ),
              SizedBox(height: Dimens.d20.responsive()),
              Row(
                children: [
                  Image.asset(
                    AppIcons.iconMoisture,
                    width: Dimens.d24.responsive(),
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: Dimens.d4.responsive()),
                  Text(
                    'Moisture',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              Text(
                plantDetailModel?.moisture
                        ?.map((e) => e.title)
                        .toList()
                        .join(', ') ??
                    '',
              ),
              SizedBox(height: Dimens.d20.responsive()),
              Row(
                children: [
                  Image.asset(
                    AppIcons.iconPh,
                    width: Dimens.d24.responsive(),
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: Dimens.d4.responsive()),
                  Text(
                    'Ph',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              Text(
                plantDetailModel?.ph
                        ?.map((e) => e.title)
                        .toSet()
                        .toList()
                        .join(', ') ??
                    '',
              ),
              SizedBox(height: Dimens.d8.responsive()),
              SizedBox(
                width: double.infinity,
                height: Dimens.d40.responsive(),
                child: Row(
                  children: List.generate(
                    PHLevelX.colors.length,
                    (index) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.d3.responsive(),
                        ),
                        child: Opacity(
                          opacity: plantDetailModel?.ph?.any(
                                    (e) => e.id == index,
                                  ) ??
                                  false
                              ? 1
                              : 0.25,
                          child: Column(
                            children: [
                              Text(
                                index.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: Dimens.d10.responsive(),
                                    ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: PHLevelX.colors[index],
                                    borderRadius: BorderRadius.circular(
                                      Dimens.d14.responsive(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
