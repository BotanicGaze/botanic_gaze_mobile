import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hintText,
    super.key,
    this.prefixIcon,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
  });
  final Widget? prefixIcon;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: const Color(0xFFF3F3F3),
        hintStyle: TextStyle(fontSize: Dimens.d15.sp),
        filled: true,
        enabled: enabled,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: Dimens.d12.responsive(),
              vertical: Dimens.d10.responsive(),
            ),
        prefixIconColor: AppColors.iconPrimaryColor,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(
                  right: Dimens.d12.responsive(),
                  left: Dimens.d16.responsive(),
                  top: Dimens.d14.responsive(),
                  bottom: Dimens.d14.responsive(),
                ),
                child: prefixIcon,
              )
            : null,
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
        ),
      ),
    );
  }
}
