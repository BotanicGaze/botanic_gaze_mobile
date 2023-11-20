import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPhotoWrapper extends StatefulWidget {
  GalleryPhotoWrapper({
    required this.galleryImages,
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryImages;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoWrapperState();
  }
}

class _GalleryPhotoWrapperState extends State<GalleryPhotoWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const ClampingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryImages.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black38,
              ),
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Image ${currentIndex + 1}' '/${widget.galleryImages.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            AppSafeArea(
              minimum: EdgeInsets.all(Dimens.d16.responsive()),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    // final GalleryExampleItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions.customChild(
      child: CachedImageWidget(imageUrl: widget.galleryImages[index]),
      // childSize: const Size(300, 300),
      initialScale: PhotoViewComputedScale.contained,
      minScale: 0.5, //PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: 1.5, // PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryImages[index]),
    );
  }
}
