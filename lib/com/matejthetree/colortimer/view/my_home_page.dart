import 'package:color_meditation/com/matejthetree/colortimer/view/timer_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          fontFamily: '.SF UI Text',
          fontSize: 17.0,
          color: Colors.black,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//              const Padding(padding: const EdgeInsets.only(top: 32.0)),

                TimerPicker()
              ]),
        ),
      ),
    );
  }
}
