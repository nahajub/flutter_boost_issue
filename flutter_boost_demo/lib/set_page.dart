import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {  


  bool open = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('set'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                FlutterBoost.singleton.closeCurrent();
              },
            )
          ],
        ),
      ),
      body: Column(
        children: /*_getWidgets(_dataSource)*/
        [
          Switch(
            value: open,
            onChanged: (v){
              setState(() {
                open = v;
              });
            },
          )
        ],
      ),
    );
  }
}

