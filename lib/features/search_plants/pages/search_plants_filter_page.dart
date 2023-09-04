import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPlantsFilterPage extends StatefulWidget {
  const SearchPlantsFilterPage({
    this.initFilter = const SearchPlantsFilter(),
    super.key,
  });

  final SearchPlantsFilter initFilter;

  @override
  State<SearchPlantsFilterPage> createState() => _SearchPlantsFilterPageState();
}

class _SearchPlantsFilterPageState
    extends BasePageState<SearchPlantsFilterPage, SearchPlantsFilterBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(InitSelectedData(widget.initFilter));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      otherBackground: otherBackground(),
      // backgroundColor: const Color(0xFFF6F9FA),
      appBar: AppBar(
        title: const Text('Search filter'),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SunlightSelected(),
            SizedBox(height: Dimens.d10.responsive()),
            const SoilTypeSelected(),
            SizedBox(height: Dimens.d10.responsive()),
            const SeasonOfInterestSelected(),
            SizedBox(height: Dimens.d10.responsive()),
            const PlantingTypeSelected(),
            SizedBox(height: Dimens.d10.responsive()),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        // padding: EdgeInsets.all(Dimens.d16.responsive()),
        child: AppSafeArea(
          minimum: EdgeInsets.symmetric(
            horizontal: Dimens.d16.responsive(),
            vertical: Dimens.d12.responsive(),
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => bloc.add(ResetAllFilter()),
                  child: const Text('Reset all'),
                ),
              ),
              SizedBox(width: Dimens.d16.responsive()),
              Expanded(
                child: BlocBuilder<SearchPlantsFilterBloc,
                    SearchPlantsFilterState>(
                  builder: (context, state) {
                    return FilledButton(
                      onPressed: () {
                        context.pop(
                          SearchPlantsFilter(
                            sunlightSelected: state.sunlightSelected,
                            soilTypeSelected: state.soilTypeSelected,
                            seasonOfInterestSelected:
                                state.seasonOfInterestSelected,
                            plantTypesSelected: state.plantTypesSelected,
                          ),
                        );
                      },
                      child: const Text('Apply filters'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> otherBackground() {
    return [
      // Align(
      //   alignment: Alignment.topRight,
      //   child: Image.asset(
      //     AppImages.imageBackground1,
      //     width: ScreenUtil().screenHeight * 0.2,
      //   ),
      // ),
      // Align(
      //   alignment: Alignment.bottomRight,
      //   child: Opacity(
      //     opacity: 0.3,
      //     child: Image.asset(
      //       AppImages.imageBackground2,
      //       width: ScreenUtil().screenHeight * 0.2,
      //     ),
      //   ),
      // ),
      // Align(
      //   alignment: Alignment.bottomLeft,
      //   child: Opacity(
      //     opacity: 0.4,
      //     child: Image.asset(
      //       AppImages.imageBackground3,
      //       width: ScreenUtil().screenHeight * 0.2,
      //     ),
      //   ),
      // )
    ];
  }
}

class SeasonOfInterestSelected extends StatelessWidget {
  const SeasonOfInterestSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchPlantsFilterBloc>();
    return BlocSelector<SearchPlantsFilterBloc, SearchPlantsFilterState,
        List<SeasonOfInterest>>(
      selector: (state) => state.seasonOfInterestSelected,
      builder: (context, state) {
        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Season of interest',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: state.isNotEmpty,
                    child: CupertinoButton(
                      minSize:
                          Theme.of(context).textTheme.headlineMedium?.height,
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          bloc.add(SelectedSeasonOfInterest(clearAll: true)),
                      child: const Text('Clear'),
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: Dimens.d16.responsive(),
                crossAxisSpacing: Dimens.d16.responsive(),
                children:
                    List.generate(SeasonOfInterest.values.length, (index) {
                  final value = SeasonOfInterest.values[index];
                  final isSelected = state.any((e) => e.id == value.id);
                  return GestureDetector(
                    onTap: () {
                      bloc.add(SelectedSeasonOfInterest(data: value));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.d16.responsive(),
                              ),
                              border: Border.all(
                                width: Dimens.d2.responsive(),
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            padding: EdgeInsets.all(Dimens.d2.responsive()),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.d12.responsive(),
                              ),
                              child: Image.asset(value.image),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.d8.responsive()),
                        Text(
                          value.title,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : null,
                                  ),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

class SoilTypeSelected extends StatelessWidget {
  const SoilTypeSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchPlantsFilterBloc>();
    return BlocSelector<SearchPlantsFilterBloc, SearchPlantsFilterState,
        List<SoilType>>(
      selector: (state) => state.soilTypeSelected,
      builder: (context, state) {
        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Soil',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: state.isNotEmpty,
                    child: CupertinoButton(
                      minSize:
                          Theme.of(context).textTheme.headlineMedium?.height,
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          bloc.add(SelectedSoilType(clearAll: true)),
                      child: const Text('Clear'),
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(SoilType.values.length, (index) {
                    final value = SoilType.values[index];
                    final isSelected = state.any((e) => e.id == value.id);
                    return CustomRawChip(
                      avatar: Image.asset(value.image),
                      label: Text(value.title),
                      selected: isSelected,
                      onSelected: (_) =>
                          bloc.add(SelectedSoilType(data: value)),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SunlightSelected extends StatelessWidget {
  const SunlightSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchPlantsFilterBloc>();
    return BlocSelector<SearchPlantsFilterBloc, SearchPlantsFilterState,
        List<Sunlight>>(
      selector: (state) {
        return state.sunlightSelected;
      },
      builder: (context, state) {
        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Sunlight',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: state.isNotEmpty,
                    child: CupertinoButton(
                      minSize:
                          Theme.of(context).textTheme.headlineMedium?.height,
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          bloc.add(SelectedSunlight(clearAll: true)),
                      child: const Text('Clear'),
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(
                    Sunlight.values.length,
                    (index) {
                      final value = Sunlight.values[index];
                      final isSelected = state.any((e) => e.id == value.id);
                      return CustomRawChip(
                        avatar: Image.asset(value.image),
                        label: Text(value.title),
                        selected: isSelected,
                        onSelected: (_) =>
                            bloc.add(SelectedSunlight(data: value)),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class PlantingTypeSelected extends StatelessWidget {
  const PlantingTypeSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchPlantsFilterBloc>();
    return BlocSelector<SearchPlantsFilterBloc, SearchPlantsFilterState,
        List<PlantType>>(
      selector: (state) {
        return state.plantTypesSelected;
      },
      builder: (context, state) {
        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Planting type',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: state.isNotEmpty,
                    child: CupertinoButton(
                      minSize:
                          Theme.of(context).textTheme.headlineMedium?.height,
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          bloc.add(SelectedPlantingType(clearAll: true)),
                      child: const Text('Clear'),
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimens.d8.responsive()),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: Dimens.d8.responsive(),
                  runSpacing: Dimens.d8.responsive(),
                  children: List.generate(PlantType.values.length, (index) {
                    final value = PlantType.values[index];
                    final isSelected = state.any((e) => e.id == value.id);
                    return CustomRawChip(
                      label: Text(value.title),
                      selected: isSelected,
                      onSelected: (_) =>
                          bloc.add(SelectedPlantingType(data: value)),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomRawChip extends StatelessWidget {
  const CustomRawChip({
    required this.label,
    required this.selected,
    super.key,
    this.avatar,
    this.onSelected,
  });

  final Widget? avatar;
  final Widget label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      showCheckmark: false,
      avatar: avatar,
      label: label,
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).colorScheme.secondary,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: selected ? Theme.of(context).primaryColor : null,
            fontWeight: selected ? FontWeight.w500 : null,
          ),
      backgroundColor: Colors.white,
      side: BorderSide(
        color: selected
            ? Theme.of(context).primaryColor
            : Theme.of(context).dividerTheme.color ?? Colors.transparent,
        width: Dimens.d1.responsive(),
      ),
    );
  }
}
