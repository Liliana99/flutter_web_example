import 'package:flutter/material.dart';

class OpenScreenRoute {
  Future<void> openSCreen(BuildContext context, Function route) async {
     Navigator.of(context).push(
            MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: route,
            ),
          );
  }
  
}
