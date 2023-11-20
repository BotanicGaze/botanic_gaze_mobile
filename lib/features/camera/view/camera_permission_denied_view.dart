import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:permission_client/permission_client.dart';

class CameraPermissionDeniedView extends StatelessWidget {
  const CameraPermissionDeniedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d20.responsive()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            PermissionType.camera.image,
            width: Dimens.d215.responsive(),
            height: Dimens.d215.responsive(),
          ),
          SizedBox(height: Dimens.d6.responsive()),
          Text(
            PermissionType.camera.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimens.d12.responsive()),
          Text(
            PermissionType.camera.content,
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
                PermissionType.camera.confirmTexts,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('No, I’m not sure.'),
            ),
          ),
        ],
      ),
    );
  }
}
