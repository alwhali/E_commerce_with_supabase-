import 'dart:ui';

import 'package:flutter/material.dart';

Widget snackBarMessage(BuildContext context, String message, backgroundColor) {
  return SnackBar(
    backgroundColor: backgroundColor,
    content: Text(message, style: TextStyle(color: Colors.white)),
  );
}
