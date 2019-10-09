// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_ticket_package/flutter_ticket_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: TicketPass(
            width: 300,
            height: 200,
            shadowColor: Colors.blue.withOpacity(0.5),
            elevation: 8,
            shouldExpand: true,
            child: Container(
              color: Colors.blue,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}