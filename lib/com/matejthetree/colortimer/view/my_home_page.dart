import 'package:color_meditation/com/matejthetree/colortimer/model/timer_model.dart';
import 'package:color_meditation/com/matejthetree/colortimer/view/start_button.dart';
import 'package:color_meditation/com/matejthetree/colortimer/view/timer_picker.dart';
import 'package:organic_injection/organic_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyHomePageState();


}

class _MyHomePageState extends State<HomePage> {



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

                GestureDetector(                behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      await showModalBottomSheet<Null>(
                        context: context,
                        builder: (BuildContext context) {
                          return BottomModalTimePicker();
                        },
                      );
                    },child: TimerPicker()),
                StartButton()
              ]),
        ),
      ),
    );
  }

}

class BottomModalTimePicker extends StatelessWidget{

  double _kPickerSheetHeight = 216.0;
  double _kPickerItemHeight = 32.0;

  FixedExtentScrollController scrollController;

  TimerModel _timerModel;


  BottomModalTimePicker(){
    _timerModel = Injector.instance.getInstance(TimerModel);
    scrollController =
    new FixedExtentScrollController(initialItem: _timerModel.selectedDurationIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: _kPickerSheetHeight,
      child: new DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: new CupertinoPicker(
            scrollController: scrollController,
            itemExtent: _kPickerItemHeight,
            backgroundColor: const Color(0xFFEFEFF4),
            onSelectedItemChanged: (int index) {
              _timerModel.selectedDurationIndex = index;
            },
            children: new List<Widget>.generate(_timerModel.availableDurations.length, (int index) {
              return new Center(
                child: new Text((_timerModel.availableDurations[index]).toString()),
              );
            }),
          ),
        ),
      ),
    );

  }
}
