import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;
import 'package:fluttertoast/fluttertoast.dart';

class HomeTPage extends StatelessWidget {
  HomeTPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString('assets/data.json'),
              builder: (context, snapshot) {
                var sdata = json.decode(snapshot.data.toString());
                developer.log('sdata', name: sdata.toString());

                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var data = sdata[index];
                    return new Card(
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text("Title: " + data['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          new Text("Category: " + data['category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20)),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('TAP HERE'),
                                onPressed: () {
                                  showToast(context);
                                },
                              ),
                              FlatButton(
                                child: const Text('CLICK HERE'),
                                onPressed: () {
                                  showToast(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: sdata == null ? 0 : sdata.length,
                );
              }),
        ),
      ),
    );
  }
}

void showToast(BuildContext context) {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
