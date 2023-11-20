import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/widgets/button/button_enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton.fullSize({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.fullSize;

  const AppButton.large({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.large;

  const AppButton.medium({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.medium;

  const AppButton.normal({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.normal;

  const AppButton.small({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.small;

  const AppButton.xSmall({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.xSmall;

  const AppButton.xxSmall({
    required this.child,
    required this.onPressed,
    super.key,
    this.alignment = Alignment.center,
    this.backgroundColor,
  }) : _buttonSize = FowButtonSize.xxSmall;

  final Widget child;
  final VoidCallback? onPressed;
  final FowButtonSize _buttonSize;
  final Color? backgroundColor;
  final AlignmentGeometry alignment;

  bool get enabled => onPressed != null;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(AppButton old) {
    super.didUpdateWidget(old);
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;

    final foregroundColor = enabled ? Colors.white : Colors.white54;

    final textStyle = TextStyle(
      fontSize: widget._buttonSize.fontSize,
      fontWeight: FontWeight.bold,
      color: foregroundColor,
    );

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      child: Semantics(
        button: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.d32.responsive()),
          child: Container(
            constraints: BoxConstraints(
              minWidth: widget._buttonSize.size.width,
              minHeight: widget._buttonSize.size.height,
            ),
            decoration: BoxDecoration(
              color: enabled
                  ? widget.backgroundColor
                  : Theme.of(context).primaryColor.withOpacity(0.5),
              gradient: (enabled && widget.backgroundColor == null)
                  ? LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ],
                    )
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.25),
                onTapDown: enabled ? _handleTapDown : null,
                onTapUp: enabled ? _handleTapUp : null,
                onTapCancel: enabled ? _handleTapCancel : null,
                onTap: widget.onPressed,
                child: Align(
                  alignment: widget.alignment,
                  widthFactor: 1,
                  heightFactor: 1,
                  child: DefaultTextStyle(
                    style: textStyle,
                    child: IconTheme(
                      data: IconThemeData(color: foregroundColor),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
