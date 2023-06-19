import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../enum/parayer.dart';

class ParayerTime extends StatefulWidget {
  const ParayerTime({super.key});

  @override
  State<ParayerTime> createState() => _ParayerTimeState();
}

class _ParayerTimeState extends State<ParayerTime> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
          ),
          Center(
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 10000,
              radius: 120,
              lineWidth: 20,
              percent: 1,
              center: Text("12:10:10",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
            ),
          ),
          SizedBox(height: 30,),
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
