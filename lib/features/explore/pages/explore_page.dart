import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/features/explore/views/explore_plant_type.dart';
import 'package:botanic_gaze/features/explore/views/flower_of_season.dart';
import 'package:botanic_gaze/features/explore/views/popular_plant.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends BasePageState<ExplorePage, ExploreBloc> {
  @override
  void initState() {
    super.initState();
    bloc
      ..add(GetWeatherData())
      ..add(GetFlowerOfSeason());
    // ..add(PopularPlantInit(page: 1));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: WeatherView(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: Dimens.d16.responsive()),
              child: const ExplorePlantTypes(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: Dimens.d16.responsive()),
              child: const FlowerOfSeasonView(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Dimens.d16.responsive()),
              child: Text(
                'Popular plants',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: AppFontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
          const PopularPlantView(),
          // CommonPagedSliverList(
          //   pagingController: null,
          //   itemBuilder: (BuildContext context, item, int index) {},
          // )
        ],
      ),
      // const SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       WeatherView(),
      //       ExplorePlantTypes(),
      //       FlowerOfSeasonView(),
      //     ],
      //   ),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
