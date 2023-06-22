import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:adhan_dart/adhan_dart.dart';
import 'package:timezone/timezone.dart';
import '../enum/parayer.dart';

class ParayerTime extends StatefulWidget {
  const ParayerTime({super.key});

  @override
  State<ParayerTime> createState() => _ParayerTimeState();
}

class _ParayerTimeState extends State<ParayerTime>
    with SingleTickerProviderStateMixin {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 30);
  late Location location;
  late DateTime date;
  late Coordinates coordinates;
  late CalculationParameters params;
  late PrayerTimes prayerTimes;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    location = tz.getLocation('Asia/Riyadh');

    // Definitions
    date = tz.TZDateTime.from(DateTime.now(), location);
    coordinates = Coordinates(24.774265, 46.738586);

    // Parameters
    params = CalculationMethod.UmmAlQura();
    params.madhab = Madhab.Hanafi;
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
    DateTime fajrTime = tz.TZDateTime.from(prayerTimes.fajr!, location);
    DateTime sunriseTime = tz.TZDateTime.from(prayerTimes.sunrise!, location);
    DateTime dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr!, location);
    DateTime asrTime = tz.TZDateTime.from(prayerTimes.asr!, location);
    DateTime maghribTime = tz.TZDateTime.from(prayerTimes.maghrib!, location);
    DateTime ishaTime = tz.TZDateTime.from(prayerTimes.isha!, location);
    print('\n***** Prayer Times');
    print('fajrTime:\t$fajrTime');
    print('sunriseTime:\t$sunriseTime');
    print('dhuhrTime:\t$dhuhrTime');
    print('asrTime:\t$asrTime');
    print('maghribTime:\t$maghribTime');
    print('ishaTime:\t$ishaTime');
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
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

  getPrayerTime() {}

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
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        child: Text(
                          '$hours :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        child: Text(
                          ' $minutes :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        child: Text(
                          '$seconds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
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
