import 'package:flutter/material.dart';
class StartButton extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/color'),
      child: new SizedBox(
        width: 120.0,
        height: 120.0,
        child: new DecoratedBox(
          child: new Center(
            child: new Text("START"),
          ),
          decoration: new BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        ),
      ),

    );

  }


}
