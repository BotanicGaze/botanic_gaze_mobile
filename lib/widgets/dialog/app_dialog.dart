import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

const Duration _dialogDisplayDuration = Duration(seconds: 2);

class AppDialog extends StatefulWidget {
  const AppDialog({
    required this.style,
    required this.content,
    required this.duration,
    this.title,
    super.key,
    this.onClose,
    this.largePadding = false,
  });
  final AppDialogStyle style;
  final String? title;
  final String content;
  final Duration duration;
  final bool largePadding;
  final VoidCallback? onClose;

  @override
  State<AppDialog> createState() => _AppDialogState();

  static Future<T?> showSuccess<T extends Object?>(
    BuildContext context, {
    required String content,
    VoidCallback? onClose,
    bool barrierDismissible = true,
    Duration duration = _dialogDisplayDuration,
    bool largePadding = true,
  }) async =>
      showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        // barrierColor: bgMainColor.withOpacity(0.8),
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(barrierDismissible),
            child: AppDialog(
              style: AppDialogStyle.success,
              content: content,
              onClose: onClose,
              duration: duration,
              largePadding: largePadding,
            ),
          );
        },
      );

  static Future<T?> showFailure<T extends Object?>(
    BuildContext context, {
    required String? content,
    VoidCallback? onClose,
    bool barrierDismissible = true,
    bool largePadding = true,
    Duration duration = _dialogDisplayDuration,
  }) async =>
      showDialog<T?>(
        context: context,
        // barrierColor: bgMainColor.withOpacity(0.8),
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(barrierDismissible),
            child: AppDialog(
              style: AppDialogStyle.failure,
              content: content ?? '',
              onClose: onClose,
              duration: duration,
              largePadding: largePadding,
            ),
          );
        },
      );
}

class _AppDialogState extends State<AppDialog> {
  EdgeInsetsGeometry dialogPadding = const EdgeInsets.all(12);

  @override
  void initState() {
    super.initState();
    dialogPadding = widget.largePadding
        ? EdgeInsets.symmetric(
            horizontal: Dimens.d42.responsive(),
            vertical: Dimens.d24.responsive(),
          )
        : EdgeInsets.all(Dimens.d12.responsive());
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     Future.delayed(widget.duration, () {
    //       if (mounted) Navigator.of(context).pop();
    //     });
    //   },
    // );
  }

  @override
  void deactivate() {
    // widget.onClose?.call();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ScreenUtil().screenWidth - Dimens.d48.responsive(),
        ),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          type: MaterialType.card,
          child: Padding(
            padding: dialogPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.style.dialogIcon,
                SizedBox(height: 8.h),
                Text(
                  widget.title ?? 'Success',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: Dimens.d16.responsive()),
                Text(
                  widget.content,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Dimens.d24.responsive()),
                AppButton.fullSize(
                  onPressed: () {
                    context.pop();
                    widget.onClose?.call();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
