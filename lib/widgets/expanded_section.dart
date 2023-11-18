import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  const ExpandedSection({
    required this.title,
    required this.content,
    super.key,
    this.onExpansionChanged,
    this.expandedCrossAxisAlignment,
    this.maintainState = false,
    this.leading,
    this.trailing,
    this.tilePadding,
  });

  final ValueChanged<bool>? onExpansionChanged;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final bool maintainState;
  final Widget content;
  final Widget? leading;
  final Widget? trailing;
  final Widget title;
  final EdgeInsetsGeometry? tilePadding;

  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with TickerProviderStateMixin {
  final Duration _kExpand = const Duration(milliseconds: 200);

  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0, end: 0.5);

  final ShapeBorderTween _borderTween = ShapeBorderTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<ShapeBorder?> _border;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _border = _controller.drive(_borderTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: widget.trailing ?? const Icon(Icons.expand_more),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final expansionTileTheme = ExpansionTileTheme.of(context);
    final expansionTileBorder = _border.value ??
        const Border(
          top: BorderSide(color: Colors.transparent),
          bottom: BorderSide(color: Colors.transparent),
        );
    final clipBehavior = expansionTileTheme.clipBehavior ?? Clip.none;

    return Container(
      clipBehavior: clipBehavior,
      decoration: ShapeDecoration(
        color: _backgroundColor.value ??
            expansionTileTheme.backgroundColor ??
            Colors.transparent,
        shape: expansionTileBorder,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value ?? expansionTileTheme.iconColor,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: _handleTap,
              contentPadding:
                  widget.tilePadding ?? expansionTileTheme.tilePadding,
              leading: widget.leading,
              title: widget.title,
              trailing: widget.trailing.runtimeType == SizedBox
                  ? null
                  : _buildIcon(context),
            ),
          ),
          ClipRect(
            child: Align(
              alignment:
                  expansionTileTheme.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   final theme = Theme.of(context);
  //   final expansionTileTheme = ExpansionTileTheme.of(context);
  //   final colorScheme = theme.colorScheme;
  //   _borderTween
  //     ..begin = widget.collapsedShape ??
  //         expansionTileTheme.collapsedShape ??
  //         const Border(
  //           top: BorderSide(color: Colors.transparent),
  //           bottom: BorderSide(color: Colors.transparent),
  //         )
  //     ..end = widget.shape ??
  //         expansionTileTheme.collapsedShape ??
  //         Border(
  //           top: BorderSide(color: theme.dividerColor),
  //           bottom: BorderSide(color: theme.dividerColor),
  //         );
  //   _headerColorTween
  //     ..begin = widget.collapsedTextColor ??
  //         expansionTileTheme.collapsedTextColor ??
  //         theme.textTheme.titleMedium!.color
  //     ..end = widget.textColor ??
  //         expansionTileTheme.textColor ??
  //         colorScheme.primary;
  //   _iconColorTween
  //     ..begin = widget.collapsedIconColor ??
  //         expansionTileTheme.collapsedIconColor ??
  //         theme.unselectedWidgetColor
  //     ..end = widget.iconColor ??
  //         expansionTileTheme.iconColor ??
  //         colorScheme.primary;
  //   _backgroundColorTween
  //     ..begin = widget.collapsedBackgroundColor ??
  //         expansionTileTheme.collapsedBackgroundColor
  //     ..end = widget.backgroundColor ?? expansionTileTheme.backgroundColor;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final expansionTileTheme = ExpansionTileTheme.of(context);
    final closed = !_isExpanded && _controller.isDismissed;
    final shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: expansionTileTheme.childrenPadding ?? EdgeInsets.zero,
          child: widget.content,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
