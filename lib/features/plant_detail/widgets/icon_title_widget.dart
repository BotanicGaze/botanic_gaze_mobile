import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({
    required this.imagePath,
    required this.title,
    super.key,
    this.color,
  });

  final String imagePath;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: Dimens.d20.responsive(),
          color: color ?? Theme.of(context).primaryColor,
        ),
        SizedBox(width: Dimens.d8.responsive()),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ],
    );
  }
}
