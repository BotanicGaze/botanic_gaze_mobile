import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/plant_detail/pages/gallery_photo_page.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BotanicalGallery extends StatelessWidget {
  const BotanicalGallery({super.key, this.plantNetImages});

  final PlantNetImages? plantNetImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(height: Dimens.d8.responsive()),
          DefaultTabController(
            length: 6,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
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
                SizedBox(
                  height: Dimens.d334.responsive(),
                  child: TabBarView(
                    children: [
                      _galleryCustom(plantNetImages?.flowerSmall ?? [], 0),
                      _galleryCustom(plantNetImages?.leafSmall ?? [], 1),
                      _galleryCustom(plantNetImages?.fruitSmall ?? [], 2),
                      _galleryCustom(plantNetImages?.barkSmall ?? [], 3),
                      _galleryCustom(plantNetImages?.habitSmall ?? [], 4),
                      _galleryCustom(plantNetImages?.otherSmall ?? [], 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _galleryCustom(List<GalleryImage> data, int indexTab) {
    return GridView.custom(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d8.responsive(),
      ),
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      semanticChildCount: 6,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: Dimens.d4.responsive(),
        crossAxisSpacing: Dimens.d4.responsive(),
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(
                  ScreenPaths.galleryPhotoWrapper,
                  extra: {
                    // 'initial_index': index,
                    'gallery_images': [data[index].m ?? ''],
                  },
                );
              },
              child: Hero(
                tag: data[index].m ?? DateTime.now().toIso8601String(),
                child: CachedImageWidget(
                  imageUrl: data[index].m ?? '',
                  borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
                ),
              ),
            ),
            Visibility(
              visible: index == 6,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => GalleryPhotoPage(
                        plantNetImages: plantNetImages,
                        initialIndex: indexTab,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
                  ),
                  child: Center(
                    child: Text(
                      'View more',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        childCount: data.length,
      ),
    );
  }
}

class CustomTab extends Tab {
  const CustomTab({
    super.key,
    super.text,
    super.icon,
    super.iconMargin = const EdgeInsets.only(right: 10),
    super.height,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    const kTabHeight = 46.0;
    const kTextAndIconTabHeight = 38.0;
    final double calculatedHeight;
    final Widget label;
    if (icon == null) {
      calculatedHeight = kTabHeight;
      label = _buildLabelText();
    } else if (text == null && child == null) {
      calculatedHeight = kTabHeight;
      label = icon!;
    } else {
      calculatedHeight = kTextAndIconTabHeight;
      label = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: iconMargin,
            child: icon,
          ),
          _buildLabelText(),
        ],
      );
    }

    return SizedBox(
      height: height ?? calculatedHeight,
      child: Center(
        widthFactor: 1,
        child: label,
      ),
    );
  }

  Widget _buildLabelText() {
    return child ?? Text(text!, softWrap: false, overflow: TextOverflow.fade);
  }
}
