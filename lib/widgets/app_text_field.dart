import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
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
    this.onClear,
    this.maxLine,
    this.validator,
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
  final FormFieldValidator<String>? validator;
  final VoidCallback? onClear;
  final int? maxLine;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: controller,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      maxLines: widget.maxLine,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: const Color(0xFFF3F3F3),
        hintStyle: TextStyle(fontSize: Dimens.d15.sp),
        filled: true,
        enabled: widget.enabled,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: Dimens.d12.responsive(),
              vertical: Dimens.d10.responsive(),
            ),
        prefixIconColor: AppColors.iconPrimaryColor,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(
                  right: Dimens.d12.responsive(),
                  left: Dimens.d16.responsive(),
                  top: Dimens.d14.responsive(),
                  bottom: Dimens.d14.responsive(),
                ),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: _suffixIcon(),
        suffixIconColor: AppColors.iconPrimaryColor,
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
        ),
      ),
    );
  }

  Row _suffixIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            return Visibility(
              visible: value.text.trim().isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(
                  right: Dimens.d12.responsive(),
                  left: Dimens.d16.responsive(),
                  top: Dimens.d14.responsive(),
                  bottom: Dimens.d14.responsive(),
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: Dimens.d16.responsive(),
                  onPressed: () {
                    controller.clear();
                    widget.onClear?.call();
                  },
                  child: Image.asset(
                    AppIcons.iconClean,
                    width: Dimens.d16.responsive(),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
