import 'dart:async';

import 'package:flutter/material.dart';

class TextTimerWidget extends StatefulWidget {
  TextTimerWidget({super.key, required this.time});
  int time;
  @override
  State<TextTimerWidget> createState() => _TextTimerWidgetState();
}

class _TextTimerWidgetState extends State<TextTimerWidget> {

  late Timer _timer;

  startTimer(){
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (timer) {
      setState(() {
        if(widget.time == 0){
          _timer.cancel();
          Navigator.of(context).pop();
        } else {
          widget.time--;
        }
      });
    },);
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int seconds = sec % 60;

    String minStr = min.toString().padLeft(2,"0");
    String secondsStr = seconds.toString().padLeft(2,"0");
    return "$minStr:$secondsStr";
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTime(widget.time));
  }
}