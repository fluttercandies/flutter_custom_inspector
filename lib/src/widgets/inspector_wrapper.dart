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
  })  : assert(child != null),
        super(key: key);

  final Widget child;
  final InspectorSelectButtonBuilder selectButtonBuilder;
  final String Function(Element element) tooltipBuilder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: InspectorController.isEnabled,
      builder: (_, bool isEnabled, __) {
        if (isEnabled) {
          return CustomWidgetInspector(
            child: child,
            selectButtonBuilder: selectButtonBuilder ??
                (
                  _,
                  VoidCallback onPressed,
                ) {
                  return FloatingActionButton(
                    child: const Icon(Icons.search),
                    onPressed: onPressed,
                    mini: true,
                  );
                },
            tooltipBuilder: tooltipBuilder ?? (Element element) {
              return 'Holy molly, this is a ${element.runtimeType} element!';
            },
          );
        }
        return child;
      },
    );
  }
}
