import 'dart:async';

import 'package:flutter/material.dart';

import '../../equal_ui.dart';

class ETimer extends StatefulWidget {
  const ETimer({
    super.key,
    required this.seconds,
    this.onFinished,
  });

  final int seconds;
  final VoidCallback? onFinished;

  @override
  State<ETimer> createState() => _ETimerState();
}

class _ETimerState extends State<ETimer> {
  late Timer _timer;

  late int _timeCounter;

  void _startTimer() {
    _timeCounter = widget.seconds;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_timeCounter <= 0) {
          timer.cancel();
          widget.onFinished?.call();
        } else {
          setState(() {
            _timeCounter = (_timeCounter - 1);
          });
        }
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '00:${_timeCounter < 10 ? '0$_timeCounter' : _timeCounter}',
      style: EtextStyle.style.size12.w400.copyWith(
        color: EColors.GREY_STRONG,
      ),
    );
  }
}
