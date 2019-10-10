// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> sample = <String>[
    'Sample data 1',
    'Sample data 2',
    'Sample data 3',
    'Sample data 4',
    'Sample data 5',
    'Sample data 6',
    'Sample data 7',
    'Sample data 8'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket Pass',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie Ticket Pass'),
        ),
        body: Center(
          child: TicketPass(
            alignment: Alignment.center,
            animationDuration: Duration(seconds: 2),
//            expansionChild: Expanded(
//              child: Container(
//                color: Colors.black,
//              ),
//            ),
            expandedHeight: 600,
            expandIcon: CircleAvatar(
              maxRadius: 14,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20,
              ),
            ),
            expansionTitle: Text(
              'Purchased By',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            purchaserList: sample,
            separatorColor: Colors.black,
            separatorHeight: 2.0,
            color: Colors.white,
            curve: Curves.easeOut,
            titleColor: Colors.blue,
            shrinkIcon: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                maxRadius: 14,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            ticketTitle: Text(
              'Sample title',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            titleHeight: 50,
            width: 350,
            height: 220,
            shadowColor: Colors.blue.withOpacity(0.5),
            elevation: 8,
            shouldExpand: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 5),
              child: Container(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Movie Time',
                                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Text(
                                      '12:00 PM',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: <Widget>[
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                    Text(
                                      'Movie name',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Text(
                                    'Date',
                                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    '4th Nov,2019 ',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Text(
                                    'PRICE',
                                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    '\$20 ',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}