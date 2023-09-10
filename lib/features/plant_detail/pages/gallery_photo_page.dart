import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPhotoPage extends StatefulWidget {
  const GalleryPhotoPage({super.key, this.plantNetImages, this.initialIndex});
  final PlantNetImages? plantNetImages;
  final int? initialIndex;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoPageState();
  }
}

class _GalleryPhotoPageState extends State<GalleryPhotoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 6,
      initialIndex: widget.initialIndex ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            physics: const ClampingScrollPhysics(),
            tabs: [
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabFlowers),
                ),
                text: 'Flowers',
              ),
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabLeaves),
                ),
                text: 'Leaves',
              ),
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabFruits),
                ),
                text: 'Fruits',
              ),
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabBark),
                ),
                text: 'Bark',
              ),
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabHabits),
                ),
                text: 'Habit',
              ),
              CustomTab(
                icon: SizedBox(
                  width: Dimens.d24.responsive(),
                  child: Image.asset(AppIcons.iconTabOther),
                ),
                text: 'Order',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _galleryCustom(widget.plantNetImages?.flower ?? []),
                _galleryCustom(widget.plantNetImages?.leaf ?? []),
                _galleryCustom(widget.plantNetImages?.fruit ?? []),
                _galleryCustom(widget.plantNetImages?.bark ?? []),
                _galleryCustom(widget.plantNetImages?.habit ?? []),
                _galleryCustom(widget.plantNetImages?.other ?? []),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _galleryCustom(List<GalleryImage> data) {
    return GridView.custom(
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {
            context.pushNamed(
              NavigationContains.galleryPhotoWrapper,
              extra: {
                'initial_index': index,
                'gallery_images': data.map((e) => e.m ?? '').toSet().toList()
              },
            );
          },
          child: Hero(
            tag: data[index].m ?? DateTime.now().toIso8601String(),
            child: CachedImageWidget(imageUrl: data[index].m ?? ''),
          ),
        ),
        childCount: data.length,
      ),
    );
  }
}
