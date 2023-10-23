import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/widgets/button/button_enum.dart';
import 'package:flutter/material.dart';

class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton.fullSize({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.fullSize;

  const AppOutlineButton.large({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.large;

  const AppOutlineButton.medium({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.medium;

  const AppOutlineButton.normal({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.normal;

  const AppOutlineButton.small({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.small;

  const AppOutlineButton.xSmall({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.xSmall;

  const AppOutlineButton.xxSmall({
    required this.child,
    required this.onPressed,
    super.key,
  }) : _buttonSize = FowButtonSize.xxSmall;

  final Widget child;
  final VoidCallback? onPressed;
  final FowButtonSize _buttonSize;
  bool get enabled => onPressed != null;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      setState(() {});
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      setState(() {});
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;

    final foregroundColor = enabled
        ? Theme.of(context).primaryColor
        : Colors.grey.withOpacity(0.75);

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
              // color: !enabled ? null : null,
              borderRadius: BorderRadius.circular(Dimens.d32.responsive()),
              border: Border.all(
                color: enabled
                    ? Theme.of(context).primaryColor
                    : Colors.grey.withOpacity(0.75),
                width: 2,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Theme.of(context).primaryColor.withOpacity(0.25),
                highlightColor:
                    Theme.of(context).primaryColor.withOpacity(0.25),
                onTapDown: enabled ? _handleTapDown : null,
                onTapUp: enabled ? _handleTapUp : null,
                onTapCancel: enabled ? _handleTapCancel : null,
                onTap: widget.onPressed,
                child: Align(
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
