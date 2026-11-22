import 'package:flutter/material.dart';

class MyNavigate {
  static Future<dynamic> navigatePush(
    BuildContext context,
    Widget widget,
  ) async {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future<dynamic> navigatePushReplacement(
    BuildContext context,
    Widget widget,
  ) async {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future<dynamic> navigatePushAndRemoveUntil(
    BuildContext context,
    Widget widget, {
    List<Widget> excludeRoutes = const [],
  }) async {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) {
        // Keep routes that are not in the exclude list.
        return !excludeRoutes.any(
          (excluded) => excluded is ModalRoute && route == excluded,
        );
      },
    );
  }
}
