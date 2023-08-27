import 'package:botanic_gaze/constants/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    required this.imageUrl,
    super.key,
    this.fit,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  });
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(AppImages.appLogo),
        errorWidget: (context, url, error) => Image.asset(AppImages.appLogo),
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
