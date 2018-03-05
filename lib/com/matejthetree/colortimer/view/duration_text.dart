import 'dart:async';

import 'package:color_meditation/com/matejthetree/colortimer/enums/stream_names.dart';
import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:digital_injection/digital_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class DurationText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DurationTextState();

}

class DurationTextState extends State<DurationText>{
  int _duration;

  StreamSubscription<int> _streamSubscription;



  @override
  void initState() {
    super.initState();
    StreamController<int> durationUpdated = Injector.instance.getInstance(StreamController, name: StreamNames.durationUpdated.toString());
    TimerModel _timerModel = Injector.instance.getInstance(TimerModel);

    _duration = _timerModel.availableDurations[_timerModel.selectedDurationIndex];
    _streamSubscription = durationUpdated.stream.listen(onListen);
  }


  @override
  void deactivate() {
    super.deactivate();
    _streamSubscription.cancel();
  }

  void onListen(int value) {
    setState(() => _duration = value);
  }

  @override
  Widget build(BuildContext context) {
    return Text(_duration.toString(),style:  TextStyle(color: CupertinoColors.lightBackgroundGray),
    );
  }
}