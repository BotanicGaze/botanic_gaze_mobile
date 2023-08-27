import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_client/permission_client.dart';

class CameraBottomButtonView extends StatelessWidget {
  const CameraBottomButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        if (!state.permissionStatus.isGranted) return const SizedBox();
        return AppSafeArea(
          child: ColoredBox(
            color: const Color(0xFF343434),
            child: Padding(
              padding: EdgeInsets.all(Dimens.d40.responsive()),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPickImageView(context),
                      _takeImageButton(context),
                      Container(
                        width: Dimens.d52.responsive(),
                        height: Dimens.d52.responsive(),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(Dimens.d8.responsive()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _takeImageButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () async {
        context.read<CameraBloc>().add(TakeImageButtonPressed());
      },
      child: Image.asset(
        AppIcons.iconTakeImage,
        width: Dimens.d72.responsive(),
        height: Dimens.d72.responsive(),
      ),
    );
  }

  Widget _buildPickImageView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CameraBloc>().add(PickImageButtonPressed());
      },
      child: Container(
        width: Dimens.d52.responsive(),
        height: Dimens.d52.responsive(),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
        ),
      ),
    );
  }
}
