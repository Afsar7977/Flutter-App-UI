import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class HomeFPage extends StatelessWidget {
  HomeFPage({Key key}) : super(key: key);

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
                  itemBuilder: (BuildContext context, int index)   {
                    var data = sdata[index];
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Title: " + data['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          new Text("Category: " + data['category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20)),
                          new Text("Share: " + data['abv'],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20)),
                          new Image.network(data['image'], height: 200)
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
