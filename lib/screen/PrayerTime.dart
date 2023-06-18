import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ParayerTime extends StatefulWidget {
  const ParayerTime({super.key});

  @override
  State<ParayerTime> createState() => _ParayerTimeState();
}

class _ParayerTimeState extends State<ParayerTime> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text("Prayer time")),
    );
  }
}