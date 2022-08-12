import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

const circleProgress = 'assets/circularindicator.riv';

class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  State<CircularProgress> createState() => _OnboardState();
}

class _OnboardState extends State<CircularProgress> {
  bool darkTime = false;
  Artboard? artboard;
  RiveAnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCircleProgress();
  }

  void loadCircleProgress() async {
    final bytes = await rootBundle.load(circleProgress);
    RiveFile riveFile = RiveFile.import(bytes);

    setState(() {
      artboard = riveFile.mainArtboard
        ..addController(darkTime
            ? controller = SimpleAnimation('Animation 1')
            : controller = SimpleAnimation('Animation 1'));
    });
  }

  void onSuccess() {
    artboard!.artboard.removeController(controller!);
    artboard!.addController(darkTime
        ? SimpleAnimation('Animation 1')
        : SimpleAnimation('Animation 1'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: artboard != null ? Rive(artboard: artboard!) : Container()),
      ),
    );
  }
}
