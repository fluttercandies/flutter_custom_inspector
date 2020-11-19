import 'package:custom_inspector/custom_inspector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: (BuildContext builderContext, Widget builderChild) {
        return InspectorWrapper(
          child: builderChild,
          selectButtonBuilder: (
            _,
            VoidCallback onPressed,
          ) {
            return MaterialButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('👻 ', style: TextStyle(fontSize: 30)),
                  Text('Keep inspecting', style: TextStyle(fontSize: 16)),
                ],
              ),
              onPressed: onPressed,
            );
          },
          tooltipBuilder: (Element element) {
            return 'Holy molly, this is a ${element.runtimeType} element!';
          },
          tooltipBackgroundColor: Colors.red,
          tooltipStyle: const TextStyle(fontSize: 14.0),
          maxTooltipLines: 10,
          highlightedRenderObjectFillColor:
              const Color.fromARGB(128, 255, 128, 128),
          highlightedRenderObjectBorderColor:
              const Color.fromARGB(128, 128, 64, 64),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Press the FAB to toggle the custom inspector.'),
            ValueListenableBuilder<bool>(
              valueListenable: InspectorController.isEnabled,
              builder: (_, bool isEnabled, __) {
                return Text(
                  'The WidgetInspector has been '
                  '${isEnabled ? 'enabled' : 'disabled'}.',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: InspectorController.isEnabled,
        builder: (_, bool isEnabled, __) {
          return FloatingActionButton(
            onPressed: () {
              InspectorController.turn(!isEnabled);
            },
            tooltip: 'Toggle inspector',
            child: const Icon(Icons.search),
          );
        },
      ),
    );
  }
}
