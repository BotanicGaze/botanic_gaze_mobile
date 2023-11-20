import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/material.dart';

class NoItemsFoundIndicator extends StatelessWidget {
  const NoItemsFoundIndicator({
    required this.searchKeyword,
    super.key,
  });
  final String searchKeyword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Dimens.d16.responsive()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.d54.responsive()),
            child: Image.asset(AppImages.imageNotFound),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          Text(
            'Hmm! There’s no result for',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // SizedBox(height: Dimens.d8.responsive()),
          Padding(
            padding: EdgeInsets.all(Dimens.d8.responsive()),
            child: Text(
              searchKeyword,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          Text(
            'You can try another keyword\nor scan to identify.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: Dimens.d16.responsive()),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.75,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Scan to identify'),
            ),
          ),
        ],
      ),
    );
  }
}
