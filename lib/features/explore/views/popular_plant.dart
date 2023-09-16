import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:paging_view/paging_view.dart';

class PopularPlantView extends StatefulWidget {
  const PopularPlantView({super.key});

  @override
  State<PopularPlantView> createState() => _PopularPlantViewState();
}

class _PopularPlantViewState extends State<PopularPlantView> {
  late final _pagingController = CommonPagingController<PopularPlantModel>();

  @override
  void initState() {
    super.initState();
    context
        .read<ExploreBloc>()
        .add(PopularPlantInit(page: _pagingController.firstPageKey));
    _pagingController.listen(
      onLoadMore: (pageKey) => context.read<ExploreBloc>().add(
            PopularPlantLoadMore(page: pageKey),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreBloc, ExploreState>(
      listenWhen: (previous, current) =>
          previous.popularPlant != current.popularPlant,
      listener: (context, state) {
        _pagingController.appendLoadMoreOutput(state.popularPlant);
      },
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
          sliver: CommonPagedSliverGrid<PopularPlantModel>(
            pagingController: _pagingController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Dimens.d16.responsive(),
              crossAxisSpacing: Dimens.d16.responsive(),
            ),
            itemBuilder: (context, item, index) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CachedImageWidget(
                    imageUrl: 'https://www.rhs.org.uk${item.heroImage?.url}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.25),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.75),
                          Colors.black
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.d8.responsive())
                          .copyWith(top: Dimens.d42.responsive()),
                      child: Text(
                        item.name ?? '',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
