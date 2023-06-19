import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    _incrementCounter();
    print("Test");
  }

  double _counter = 0;

  _incrementCounter() async {
    for (var i = 0; i < 10000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(milliseconds: 16), () {
        // Delay 500 milliseconds
        setState(() {
          if (_counter < 1.0) {
            _counter = _counter + 0.00166; //Increment Counter
          }
          if (_counter > 1.0) {
            _counter = 1.0;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
          ),
          Center(
            child: new CircularPercentIndicator(
              animation: true,
              animationDuration: 10000,
              radius: 90,
              lineWidth: 7,
              percent: 1,
              center: Text(" صلاة العصر" ),
              progressColor: Colors.blueGrey[700],
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
