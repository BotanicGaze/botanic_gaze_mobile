import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/explore/bloc/popular_plant_detail/popular_plant_detail_bloc.dart';
import 'package:botanic_gaze/features/explore/views/popular_plants_list.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PopularPlantDetail extends StatefulWidget {
  const PopularPlantDetail({required this.data, super.key});

  final PopularPlantModel data;

  @override
  State<PopularPlantDetail> createState() => _PopularPlantDetailState();
}

class _PopularPlantDetailState
    extends BasePageState<PopularPlantDetail, PopularPlantListDetailBloc> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            expandedHeight: ScreenUtil().screenWidth * 9 / 16,
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
            title: ChangeNotifierProvider.value(
              value: _scrollController,
              child: Consumer<ScrollController>(
                builder: (context, value, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 120),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: value.position.pixels <
                            ScreenUtil().screenWidth * 9 / 16
                        ? const SizedBox()
                        : Text(widget.data.name ?? ''),
                  );
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // aspectRatio: 16 / 9,
              background: CachedImageWidget(
                imageUrl: 'https://www.rhs.org.uk${widget.data.heroImage?.url}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Dimens.d16.responsive()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name ?? '',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  SizedBox(height: Dimens.d8.responsive()),
                  Text(
                    (widget.data.introductionText ?? '').parseHtmlString(),
                  ),
                  Text(
                    (widget.data.looksDescription ?? '').parseHtmlString(),
                  ),
                  SizedBox(height: Dimens.d8.responsive()),
                  Text(
                    (widget.data.likesDescription ?? '').parseHtmlString(),
                  ),
                  SizedBox(height: Dimens.d8.responsive()),
                  Text(
                    (widget.data.dislikesDescription ?? '').parseHtmlString(),
                  ),
                  SizedBox(height: Dimens.d8.responsive()),
                  Text(
                    (widget.data.needToKnowDescription ?? '').parseHtmlString(),
                  ),
                  SizedBox(height: Dimens.d16.responsive()),
                  Text(
                    '${widget.data.name ?? ''}we recommend',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
          BlocProvider(
            create: (context) => PopularPlantListDetailBloc(),
            child: PopularPlantListDetailView(
              plantNames: widget.data.name ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
