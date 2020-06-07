import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_web_example/services/open_screen.dart';
import 'package:flutter_web_example/widgets/background.dart';
import 'package:flutter_web_example/widgets/thumb.dart';
import 'home_screen.dart';

class ThumNeu extends StatefulWidget {
  static const id = 'ThumNeu';
  const ThumNeu({Key key}) : super(key: key);

  @override
  _ThumNeuState createState() => _ThumNeuState();
}

class _ThumNeuState extends State<ThumNeu> {
  double opacity = 0.0;
  List<Color> gradient = [];
  final double blur = 25;

  final double spread = 0;

  final Offset offset = Offset(15, 15);

  final Color innerShadow = Color(0xff919BAC);

  final Color innerShadowPressed = Color(0xff798194);

  final Color outerShadow = Color(0xff2D2F59).withOpacity(.4);

  final Color innerLight = Color(0xffeaf0f5);

  final Color outerLight = Colors.white70;

  final Color baseColor = Color(0xffC1CBD3);

  @override
  void initState() {
    super.initState();
    gradient = [
      innerLight,
      innerShadow,
    ];
  }

  void _openScreen() {
    try {
      Future.delayed(
        const Duration(seconds: 3),
        () => OpenScreenRoute().openSCreen(
          context,
          (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print('Error $e');
    }
  }

  Widget _buildMyBody() { 
    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Background(),
          Padding(
          padding: EdgeInsets.only(top: 0),
          child: Image.asset('assets/avatar_cats.png',
              alignment: Alignment.topCenter, fit: BoxFit.fill),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(top: 280),
          child: Align(
              alignment: Alignment.topCenter,
              child: TypewriterAnimatedTextKit(
                speed: Duration(seconds: 1),
                isRepeatingAnimation: false,
                text: ['My work'],
                textStyle: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Pacifico',
                  color: Colors.teal,
                ),
              ),),
        ),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ThumbContainer(
                baseColor: baseColor,
                blur: blur,
                spread: spread,
                offset: offset,
                gradient: gradient,
                innerShadow: innerShadow,
                outerShadow: outerShadow,
                innerLight: innerLight,
                outerLight: outerLight,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            child: GestureDetector(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 1),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
              onTapDown: (details) {
                setState(() {
                  gradient = gradient.reversed.toList();
                  gradient[0] = innerShadowPressed;
                  opacity = .3;
                  _openScreen();
                });
              },
              onTapUp: (details) {
                setState(() {
                  gradient[0] = innerShadow;
                  gradient = gradient.reversed.toList();
                  opacity = 0.0;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Align(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 100),
                  opacity: opacity,
                  child: Image.asset(
                    'assets/fingerprint.png',
                    width: 100,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
        ],
      );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5B0BC),
      body: _buildMyBody(),
    );
  }
}
