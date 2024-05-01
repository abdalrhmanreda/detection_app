import 'package:flutter/material.dart';

void showAlterDia(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Alter Dialog'),
        content: Text('This is an alter dialog'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
