import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello',
      home: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: AspectRatio(aspectRatio: 20),
              color: Colors.red,
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.deepOrange,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.greenAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: AspectRatio(aspectRatio: 20, child: Row(

              ),),
              color: Colors.yellowAccent,
            )
          ],
        ),
      ),
    );
  }
}
