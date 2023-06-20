import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../enum/parayer.dart';

class ParayerTime extends StatefulWidget {
  const ParayerTime({super.key});

  @override
  State<ParayerTime> createState() => _ParayerTimeState();
}

class _ParayerTimeState extends State<ParayerTime>
    with SingleTickerProviderStateMixin {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 30);




  @override
  void initState() {
    super.initState();
print("start");
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Widget build(BuildContext context) {

String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
          ),
          Center(
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 60000 * 5,
              radius: 120,
              lineWidth: 20,
              percent: 1,
              center: Container(
                color: Colors.amber,
                child: Text(
                  '$hours:$minutes:$seconds',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              footer: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.amber,
                child: Text(
                  '$hours:$minutes:$seconds',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(PrayerTime.asr.nameInArabic,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40))
        ],
      ),
    );
  }
}
