import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class RowInfoData extends StatelessWidget {
  const RowInfoData({
    required this.title,
    required this.content,
    required this.index,
    super.key,
  });

  final String title;
  final String content;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d8.responsive(),
        horizontal: Dimens.d8.responsive(),
      ),
      decoration: BoxDecoration(
        color: index.isEven ? Theme.of(context).colorScheme.secondary : null,
        borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(width: Dimens.d8.responsive()),
          Expanded(
            flex: 6,
            child: Text(
              content,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
