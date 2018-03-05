import 'dart:async';

import 'package:color_meditation/com/matejthetree/colortimer/enums/stream_names.dart';
import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:digital_injection/digital_injection.dart';
class AppConfig {

  var injector = Injector.instance;

  AppConfig() {
    configureStreams();
    configureModels();
  }

  void configureStreams() {
    injector.mapToValue(StreamController,new  StreamController<int>.broadcast(), name: StreamNames.durationUpdated.toString());
  }

  void configureModels() {
    injector.mapToValue(TimerModel, TimerModel());
  }
}