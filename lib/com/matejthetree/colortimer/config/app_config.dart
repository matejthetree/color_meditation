import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:digital_injection/digital_injection.dart';
class AppConfig {


  AppConfig() {
    configureModels();
  }

  void configureModels() {
    var injector = Injector.instance;
    injector.mapToValue(TimerModel, TimerModel());
  }
}