library flutter_ticket_package;

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_package/dash_separator.dart';

class TicketPass extends StatefulWidget {
  const TicketPass({
    this.width = 300,
    @required this.child,
    this.color = Colors.white,
    this.height = 200,
    this.elevation = 1.0,
    this.shadowColor = Colors.black,
    this.expandedHeight = 500,
    this.shouldExpand = false,
    this.curve = Curves.easeOut,
    this.animationDuration = const Duration(seconds: 1),
    this.alignment = Alignment.center,
    this.expandIcon = const CircleAvatar(
      maxRadius: 14,
      child: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
        size: 20,
      ),
    ),
    this.shrinkIcon = const CircleAvatar(
      maxRadius: 14,
      child: Icon(
        Icons.keyboard_arrow_up,
        color: Colors.white,
        size: 20,
      ),
    ),
    this.separatorHeight = 1.0,
    this.separatorColor = Colors.black,
    this.expansionTitle = const Text(
      'Purchased By',
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    this.titleColor = Colors.blue,
    this.titleHeight = 50.0,
    this.purchaserList,
    this.ticketTitle = const Text(
      'Sample title',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    this.expansionChild,
    this.purchaserDetailsTile,
  });

  final double width;
  final double height;
  final double expandedHeight;
  final double elevation;
  final double titleHeight;
  final Widget child;
  final Color color;
  final Color shadowColor;
  final Color titleColor;
  final bool shouldExpand;
  final Curve curve;
  final Duration animationDuration;
  final Alignment alignment;
  final Widget expandIcon;
  final Widget shrinkIcon;
  final Color separatorColor;
  final double separatorHeight;
  final Text expansionTitle;
  final Text ticketTitle;
  final Widget expansionChild;
  final List<String> purchaserList;
  final ListTile purchaserDetailsTile;

  @override
  _TicketPassState createState() => _TicketPassState();
}

class _TicketPassState extends State<TicketPass> {
  bool switcher = false;
  List<String> sample = <String>[
    'Sample 1',
    'Sample 2',
    'Sample 3',
    'Sample 4',
    'Sample 5',
    'Sample 6',
    'Sample 7',
    'Sample 8'
  ];

  Widget _myWidget() {
    if (switcher && widget.shouldExpand) {
      final ScrollController _scrollController = ScrollController();
      return ClipPath(
        clipper: ExtendedClipper(),
        child: Container(
          height: widget.expandedHeight,
          child: Column(
            children: <Widget>[
              widget.child,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      switcher = !switcher;
                    });
                  },
                  child: widget.shrinkIcon,
                ),
              ),
              MySeparator(
                color: widget.separatorColor,
                height: widget.separatorHeight,
              ),
              const SizedBox(
                height: 10,
              ),
              widget.expansionTitle,
              widget.expansionChild != null
                  ? widget.expansionChild
                  : Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Scrollbar(
                            child: FadingEdgeScrollView.fromScrollView(
                              gradientFractionOnEnd: 0.7,
                              gradientFractionOnStart: 0.5,
                              child: ListView(
                                controller: _scrollController,
                                children: widget.purchaserList != null
                                    ? widget.purchaserList
                                        .map<Widget>((String name) {
                                        return Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 5),
                                            child: widget
                                                        .purchaserDetailsTile !=
                                                    null
                                                ? widget.purchaserDetailsTile
                                                : ListTile(
                                                    leading: CircleAvatar(
                                                      child: Text(
                                                        name[0],
                                                      ),
                                                    ),
                                                    title: Text(
                                                      name,
                                                    ),
                                                  ),
                                          ),
                                        );
                                      }).toList()
                                    : sample.map<Widget>((String name) {
                                        return Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 5),
                                            child: widget
                                                        .purchaserDetailsTile !=
                                                    null
                                                ? widget.purchaserDetailsTile
                                                : ListTile(
                                                    leading: CircleAvatar(
                                                      child: Text(
                                                        name[0],
                                                      ),
                                                    ),
                                                    title: Text(
                                                      name,
                                                    ),
                                                  ),
                                          ),
                                        );
                                      }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    } else
      return ClipPath(
        clipper: TicketClipper(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.child,
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    switcher = !switcher;
                  });
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: widget.titleHeight,
                    decoration: BoxDecoration(
                      color: widget.titleColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: widget.ticketTitle,
                          ),
                          widget.expandIcon,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      clipper: TicketClipper(),
      color: widget.color,
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: widget.curve,
        width: widget.width,
        height: widget.shouldExpand
            ? switcher ? widget.expandedHeight : widget.height
            : widget.height,
        child: _myWidget(),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0.0, 55);
    path.relativeArcToPoint(const Offset(0, 40),
        radius: const Radius.circular(10.0), largeArc: true);
    path.lineTo(0.0, size.height - 10);
    path.quadraticBezierTo(0.0, size.height, 10.0, size.height);
    path.lineTo(size.width - 10.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 95);
    path.arcToPoint(Offset(size.width, 55),
        radius: const Radius.circular(10.0), clockwise: true);
    path.lineTo(size.width, 10.0);
    path.quadraticBezierTo(size.width, 0.0, size.width - 10.0, 0.0);
    path.lineTo(10.0, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 10.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ExtendedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0.0, 55);
    path.relativeArcToPoint(const Offset(0, 40),
        radius: const Radius.circular(10.0), largeArc: true);
    path.lineTo(0.0, size.height - 10);
    path.quadraticBezierTo(0.0, size.height, 10.0, size.height);
    path.lineTo(size.width - 10.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 95);
    path.arcToPoint(Offset(size.width, 55),
        radius: const Radius.circular(10.0), clockwise: true);
    path.lineTo(size.width, 10.0);
    path.quadraticBezierTo(size.width, 0.0, size.width - 10.0, 0.0);
    path.lineTo(10.0, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 10.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
