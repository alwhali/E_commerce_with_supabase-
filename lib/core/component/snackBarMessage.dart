import 'dart:ui';

import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMessage(
  BuildContext context,
  String message,
  backgroundColor,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}
