import 'package:flutter/material.dart';

import 'package:paging_view/src/loading_view/three_bounce.dart';

class CommonNewPageProgressIndicator extends StatelessWidget {
  const CommonNewPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SpinKitThreeBounce(
          color: Theme.of(context).primaryColor,
          size: 25,
        ),
      ),
    );
  }
}
