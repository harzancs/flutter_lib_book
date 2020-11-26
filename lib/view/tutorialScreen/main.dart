import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';

class TutorialMain extends StatefulWidget {
  @override
  _TutorialMainState createState() => _TutorialMainState();
}

class _TutorialMainState extends State<TutorialMain> {
  GlobalKey _fabKey = GlobalObjectKey("fab"); // used by FAB
  GlobalKey _buttonKey = GlobalObjectKey("button"); // used by RaisedButton
  GlobalKey _tileKey = GlobalObjectKey("tile_2");

  @override
  void initState() {
    super.initState();
    _loadTutorial();
  }

  Future<void> _loadTutorial() async {
    Timer(Duration(seconds: 1), () => showFAB());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: _fabKey, // setting key
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    GlobalKey key = index == 2 ? _tileKey : null;
                    return ListTile(
                      key: key,
                      title: Text(index.toString()),
                      subtitle: Text('หมายเลขที่ ' + (index + 1).toString()),
                    );
                  },
                )),
            Padding(padding: EdgeInsets.all(20)),
            RaisedButton(
              key: _buttonKey, // setting key
              onPressed: showFAB,
              child: Text("RaisedButton"),
            ),
          ],
        ),
      ),
    );
  }

  // we trigger this method on RaisedButton click
  void showFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext.findRenderObject();

    // you can change the shape of the mark
    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(
        center: markRect.center, radius: markRect.longestSide * 0.6);

    coachMarkFAB.show(
      targetContext: _fabKey.currentContext,
      markRect: markRect,
      children: [
        Center(
          child: Text(
            "This is called\nFloatingActionButton",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration:
          null, // we don't want to dismiss this mark automatically so we are passing null
      // when this mark is closed, after 1s we show mark on RaisedButton
      onClose: () => Timer(Duration(seconds: 1), () => showButton()),
    );
  }

  // this is triggered once first mark is dismissed
  void showButton() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
      targetContext: _buttonKey.currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Positioned(
          top: markRect.bottom + 15.0,
          right: 5.0,
          child: Text(
            "And this is a RaisedButton",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: null, // this effect will only last for 5s
      onClose: () => Timer(Duration(seconds: 1), () => showCoachMarkTile()),
    );
  }

  void showCoachMarkTile() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _tileKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
        targetContext: _fabKey.currentContext,
        markRect: markRect,
        markShape: BoxShape.rectangle,
        children: [
          Positioned(
              top: markRect.bottom + 15.0,
              right: 5.0,
              child: Text("Tap on friend to see details",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: Duration(seconds: 3));
  }
}
