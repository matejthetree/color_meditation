import 'dart:async';

import 'package:color_meditation/com/matejthetree/colortimer/enums/stream_names.dart';
import 'package:digital_injection/digital_injection.dart';


class TimerModel implements IInjectable{


  int _selectedDurationIndex = 5; // 5 index should be 20 minutes

  List<int> availableDurations = new List<int>.generate(46, (int index){ // we create durations from 15 to 60 minutes
    return index+15;
  });

  StreamController<int> durationUpdated; // to dispatch when durations are updated


  set selectedDurationIndex (int index) {
    _selectedDurationIndex = index;
    durationUpdated.add(availableDurations[index]);
    print("duration updated: " + availableDurations[index].toString());

  }

  int get selectedDurationIndex => _selectedDurationIndex;

  @override
  List<Injectable> injectables = [Injectable(StreamController, name: StreamNames.durationUpdated.toString())];

  @override
  applyInjectable(Type type, Object value) {
    if (type == StreamController) {
      durationUpdated = value;
    }
  }





}