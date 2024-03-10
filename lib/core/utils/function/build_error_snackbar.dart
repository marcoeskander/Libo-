import 'package:flutter/material.dart';

SnackBar buildErrorSnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.redAccent,
      ),
    ),
    duration: const Duration(seconds: 2),
  );
}
