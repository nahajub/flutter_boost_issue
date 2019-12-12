import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_boost_demo/set_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstRouteWidget(),
      'setting': (pageName, params, _) => SettingPage(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container());
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class FirstRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Present Flutter'),
              onPressed: () {
                FlutterBoost.singleton.open("setting",
                    urlParams: {'present': true},
                    exts: {'animated': true}).then((Map value) {});
              },
            ),
            RaisedButton(
              child: Text('push Flutter'),
              onPressed: () {
                FlutterBoost.singleton.open("setting",
                    exts: {'animated': true}).then((Map value) {});
              },
            )
          ],
        ),
      ),
    );
  }
}

