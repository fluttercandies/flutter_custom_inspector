///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-11-18 21:51
///
import 'package:flutter/material.dart';

import '../../custom_inspector.dart';

class InspectorWrapper extends StatelessWidget {
  const InspectorWrapper({
    Key key,
    @required this.child,
    this.selectButtonBuilder,
    this.tooltipBuilder,
    this.tooltipBackgroundColor,
    this.tooltipStyle,
    this.maxTooltipLines,
    this.highlightedRenderObjectFillColor,
    this.highlightedRenderObjectBorderColor,
  })  : assert(child != null),
        super(key: key);

  final Widget child;
  final InspectorSelectButtonBuilder selectButtonBuilder;
  final String Function(Element element) tooltipBuilder;
  final Color tooltipBackgroundColor;
  final TextStyle tooltipStyle;
  final int maxTooltipLines;
  final Color highlightedRenderObjectFillColor;
  final Color highlightedRenderObjectBorderColor;

  Widget _defaultSelectButtonBuilder(
    BuildContext context,
    VoidCallback onPressed,
  ) {
    return FloatingActionButton(
      child: const Icon(Icons.search),
      onPressed: onPressed,
      mini: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: InspectorController.isEnabled,
      builder: (_, bool isEnabled, __) {
        if (isEnabled) {
          return CustomWidgetInspector(
            child: child,
            selectButtonBuilder:
                selectButtonBuilder ?? _defaultSelectButtonBuilder,
            tooltipBuilder: tooltipBuilder,
            tooltipBackgroundColor: tooltipBackgroundColor,
            tooltipStyle: tooltipStyle,
            maxTooltipLines: maxTooltipLines,
            highlightedRenderObjectFillColor: highlightedRenderObjectFillColor,
            highlightedRenderObjectBorderColor: highlightedRenderObjectBorderColor,
          );
        }
        return child;
      },
    );
  }
}
