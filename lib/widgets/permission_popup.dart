import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:permission_client/permission_client.dart';

class PermissionPopup extends StatefulWidget {
  const PermissionPopup({required this.type, super.key});

  final PermissionType type;

  @override
  State<PermissionPopup> createState() => _PermissionPopupState();

  static Future<void> show(
    BuildContext context, {
    required PermissionType type,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return PermissionPopup(type: type);
      },
    );
  }
}

class _PermissionPopupState extends State<PermissionPopup> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.d24.responsive()),
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimens.d20.responsive()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.type.image,
                width: Dimens.d215.responsive(),
                height: Dimens.d215.responsive(),
              ),
              SizedBox(height: Dimens.d6.responsive()),
              Text(
                widget.type.title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimens.d12.responsive()),
              Text(
                widget.type.content,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimens.d32.responsive()),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    const PermissionClient().openPermissionSettings();
                  },
                  child: Text(
                    widget.type.confirmTexts,
                  ),
                ),
              ),
              SizedBox(height: Dimens.d12.responsive()),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('No, I’m not sure.'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension PermissionTypeX on PermissionType {
  static final List<String> _titles = [
    'Oops! We can’t use your camera!',
    'Oops! We can’t sent notification to you!',
  ];

  String get title => _titles[index];

  static final List<String> _contents = [
    'Please allow us the access to your camera so we can scan objects.',
    'Please allow us the access to your camera so we can scan objects.'
  ];

  String get content => _contents[index];

  static final List<String> _confirmTexts = [
    'Allow camera access',
    'Oops! We can’t sent notification to you!',
  ];

  String get confirmTexts => _confirmTexts[index];

  static final List<String> _images = [
    AppImages.imageCameraPermission,
    AppImages.imageCameraPermission
  ];

  String get image => _images[index];
}
