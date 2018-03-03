import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:digital_injection/digital_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TimerPickerState();


}

class TimerPickerState extends State<TimerPicker> {

  TimerModel _timerModel = Injector.instance.getInstance(TimerModel);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[700],

      height: 44.0,
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child:  SafeArea(
          top: false,
          bottom: false,
          child:  DefaultTextStyle(
            style:  TextStyle(
              letterSpacing: -0.24,
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text('Minutes'),
                 SizedBox(width: 20.0,),
                 Text(
                  (_timerModel.duration).toString(),
                  style:  TextStyle(color: CupertinoColors.lightBackgroundGray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}