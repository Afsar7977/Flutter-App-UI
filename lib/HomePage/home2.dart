import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class HomeSPage extends StatelessWidget {
  HomeSPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          var slength;
          var sdata = json.decode(snapshot.data.toString());
          developer.log('sdata', name: sdata.toString());
          try {
            slength = sdata.length;
          } on Exception catch (_) {
            print("never reached");
          }
          return GridView.builder(
              itemCount: slength,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                image: new NetworkImage(sdata[index]['image']),
                                fit: BoxFit.cover))));
              });
        },
      ),
    ));
  }
}
