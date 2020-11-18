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
        return ValueListenableBuilder<bool>(
          valueListenable:
              WidgetInspectorController.isEnabled,
          builder: (_, bool isEnabled, __) {
            if (isEnabled) {
              return CustomWidgetInspector(
                child: builderChild,
                selectButtonBuilder: (_, VoidCallback onPressed) {
                  return FloatingActionButton(
                    child: const Icon(Icons.search),
                    onPressed: onPressed,
                    mini: true,
                  );
                },
              );
            }
            return builderChild;
          },
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
              valueListenable:
                  WidgetInspectorController.isEnabled,
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
        valueListenable:
            WidgetInspectorController.isEnabled,
        builder: (_, bool isEnabled, __) {
          return FloatingActionButton(
            onPressed: () {
              WidgetInspectorController.turn(!isEnabled);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.search),
          );
        },
      ),
    );
  }
}
