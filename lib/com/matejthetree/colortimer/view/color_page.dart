import 'dart:async';

import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:digital_injection/digital_injection.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      ColorPageState();

  ColorPage();
}

class ColorPageState extends State<ColorPage>
    with SingleTickerProviderStateMixin {
  final orange = Color(0xffcc4b00);
  final green = Color(0xff22cc00);

  Duration duration;
  Timer _timer;
  double _toolbarOpacity = 1.0;
  AnimationController _animation;
  Future _delayedFadeOut;
  Color color;

  ColorPageState();


  void onTimerFinished() {
    setState(() => color = orange);
  }

  @override
  void initState() {
    super.initState();

    color = green;

    TimerModel timerModel = Injector.instance.getInstance(TimerModel);
    duration = new Duration(minutes: timerModel.duration);

    _timer = new Timer(duration, onTimerFinished);

    _animation = new AnimationController(
        vsync: this,
        debugLabel: "opacityAppBarAnimation",
        duration: Duration(seconds: 1)
    );
    _animation.addListener(onTick);

    scheduleFadeOut(null);
  }


  @override
  void deactivate() {
    super.deactivate();
  }


  @override
  void dispose() {
    _animation?.dispose();
    _animation = null;
    _timer.cancel();
    _timer = null;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          toolbarOpacity: _toolbarOpacity,
          elevation: 0.0,
          bottomOpacity: 0.0,
          backgroundColor: color,
        ),
        backgroundColor: color,
        body: Center(),
      ),
      onDoubleTap: (() {
        Navigator.of(context).pop();
      }),
      onTap: onTap,
    );
  }

  void onTap() {

      if (_animation.status == AnimationStatus.forward) {
        _animation.reverse(from: _toolbarOpacity);
      } else if (_animation.status == AnimationStatus.reverse){
        _animation.forward(from: _toolbarOpacity).then(scheduleFadeOut);
      } else {
        if (_toolbarOpacity == 0) {
          _animation.forward(from: _toolbarOpacity).then(scheduleFadeOut);
        } else {
          _animation.reverse(from: _toolbarOpacity);
        }
      }

  }

  void onTick() {
    setState(()=> _toolbarOpacity = _animation.value);
  }

  scheduleFadeOut(Null value) {
    Future future = Future.delayed(Duration(seconds: 3));

    future.then((value){

      if (future.hashCode == _delayedFadeOut.hashCode && _animation!= null && !_animation.isAnimating && _toolbarOpacity == 1) {
        onTap();
      }
    });

    _delayedFadeOut = future;

  }
}
