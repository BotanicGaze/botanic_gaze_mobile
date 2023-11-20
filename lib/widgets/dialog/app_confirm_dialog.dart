import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

///
/// [AppConfirmDialog] auto pop when press button
///
class AppConfirmDialog extends StatefulWidget {
  const AppConfirmDialog({
    super.key,
    this.content,
    this.contentWidget,
    this.positiveText,
    this.positivePress,
    this.negativeText,
    this.negativePress,
  });
  final String? content;
  final Widget? contentWidget;
  final String? positiveText;
  final VoidCallback? positivePress;
  final String? negativeText;
  final VoidCallback? negativePress;
  @override
  State<AppConfirmDialog> createState() => _AppConfirmDialogState();

  static Future<dynamic> show(
    BuildContext context, {
    bool barrierDismissible = true,
    String? content,
    Widget? contentWidget,
    String? positiveText,
    void Function()? positivePress,
    String? negativeText,
    void Function()? negativePress,
  }) async {
    await showDialog<dynamic>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(barrierDismissible),
          child: AppConfirmDialog(
            content: content,
            contentWidget: contentWidget,
            positivePress: positivePress,
            positiveText: positiveText,
            negativePress: negativePress,
            negativeText: negativeText,
          ),
        );
      },
    );
  }
}

class _AppConfirmDialogState extends State<AppConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.d32.responsive()),
      alignment: Alignment.center,
      child: Material(
        // color: bgFieldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
        ),
        type: MaterialType.card,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 22, 26, 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.contentWidget ??
                  Text(
                    widget.content ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  AppOutlineButton.xSmall(
                    child: Text(widget.positiveText ?? 'No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.positivePress?.call();
                    },
                  ),
                  const Spacer(),
                  AppButton.xSmall(
                    child: Text(widget.negativeText ?? 'Yes'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.negativePress?.call();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
