import 'package:flutter/material.dart';

class MyNavigate {
  static Future<dynamic> navigateTo(BuildContext context, Widget widget) async {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future<dynamic> navigateAndReplacement(
    BuildContext context,
    Widget widget,
  ) async {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
