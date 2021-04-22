import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showSnackbar(BuildContext context, Widget content, SnackBarAction? action) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.removeCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: content,
      action: action,
    ),
  );
}
