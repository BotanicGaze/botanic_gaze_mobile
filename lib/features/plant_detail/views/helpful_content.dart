import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class HelpfulContentView extends StatelessWidget {
  const HelpfulContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      top: false,
      child: Stack(
        children: [
          Positioned(
            top: -Dimens.d50.responsive(),
            right: -Dimens.d60.responsive(),
            width: Dimens.d138.responsive(),
            height: Dimens.d194.responsive(),
            child: Image.asset(
              AppImages.imageBackground4,
            ),
          ),
          Positioned(
            left: -Dimens.d60.responsive(),
            width: Dimens.d94.responsive(),
            height: Dimens.d145.responsive(),
            child: Image.asset(AppImages.imageBackground5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.d35.responsive(),
              vertical: Dimens.d16.responsive(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Is this content helpful?',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: Dimens.d16.responsive()),
                  child: const Text('Your feedback help us improve.'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.d6.responsive()),
                        child: Material(
                          color: const Color(0xFFF8F7F2),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimens.d6.responsive()),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              getIt<AppNavigator>().showAppDialog(
                                const AppPopupInfo.successDialog(
                                  message: 'Thank you for your feedback',
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimens.d10.responsive(),
                                vertical: Dimens.d6.responsive(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppIcons.iconMapleLeaves,
                                    width: Dimens.d24.responsive(),
                                  ),
                                  SizedBox(width: Dimens.d4.responsive()),
                                  Text(
                                    'No, not really.',
                                    style: TextStyle(
                                      fontSize: Dimens.d14.responsive(),
                                      color: const Color(0xFF937E33),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.d12.responsive()),
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.d6.responsive()),
                        child: Material(
                          color: const Color(0xFFF2F8F6),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimens.d6.responsive()),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              getIt<AppNavigator>().showAppDialog(
                                const AppPopupInfo.successDialog(
                                  message: 'Thank you for your feedback',
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimens.d10.responsive(),
                                vertical: Dimens.d6.responsive(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppIcons.iconBloom,
                                    width: Dimens.d24.responsive(),
                                  ),
                                  SizedBox(width: Dimens.d4.responsive()),
                                  Text(
                                    'Yes, it is.',
                                    style: TextStyle(
                                      fontSize: Dimens.d14.responsive(),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
