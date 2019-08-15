import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new FadeAppTest());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SampleAppPageState();
  }

}

class _SampleAppPageState extends State<SampleAppPage>{

  bool toggle = true;
  void _toggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild(){
    if(toggle){
      return Text('toggle one');
    }else{
      return MaterialButton(onPressed: (){}, child: Text('toggle two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'update text',
        child: Icon(Icons.update),
      ),
    );
  }

}

class FadeAppTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyFadeTest(title : 'Fade demo'),
    );
  }

}

class MyFadeTest extends StatefulWidget{
  MyFadeTest({Key key, this.title}) : super(key : key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyFadeTest();
  }

}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
              opacity: curve,
              child: FlutterLogo(
                size: 100.0,
          ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
          child: Icon(Icons.brush),
          onPressed: (){
            controller.forward();
          }),
    );
  }

}