import 'dart:async';

import 'package:color_meditation/com/matejthetree/colortimer/enums/stream_names.dart';
import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:organic_injection/organic_injection.dart';
class AppConfig {

  IInjector injector = Injector.instance;

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