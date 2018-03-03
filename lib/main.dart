import 'package:color_meditation/com/matejthetree/colortimer/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'com/matejthetree/colortimer/color_timer.dart';

void main() {

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  new AppConfig();

  runApp(new ColorMeditation());
}

