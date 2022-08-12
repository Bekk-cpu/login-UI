import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeSpeedDial extends StatelessWidget {
  const HomeSpeedDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.white,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(color: Colors.deepPurple),
      children: [
        SpeedDialChild(
            onTap: () {},
            backgroundColor: Colors.white,
            child: const Icon(Icons.directions, color: Colors.deepPurple)),
        SpeedDialChild(
          onTap: () {},
          backgroundColor: Colors.white,
          child: const Icon(Icons.qr_code_scanner, color: Colors.deepPurple),
        ),
        SpeedDialChild(
            onTap: () {},
            backgroundColor: Colors.white,
            child: const Icon(Icons.gps_fixed, color: Colors.deepPurple)),
      ],
    );
  }
}
