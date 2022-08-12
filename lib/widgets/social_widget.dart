// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SocialWidget extends StatelessWidget {
  VoidCallback onTapone, onTapTwo;
  SocialWidget({Key? key, required this.onTapone, required this.onTapTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: const Image(
            image: AssetImage('assets/images/google.png'),
          ),
          onTap: onTapone,
        ),
        const SizedBox(
          width: 75.0,
        ),
        GestureDetector(
          child: FaIcon(
            FontAwesomeIcons.facebook,
            size: 41,
            color: HexColor("#3E529C"),
          ),
          onTap: onTapTwo,
        ),
      ],
    );
  }
}
