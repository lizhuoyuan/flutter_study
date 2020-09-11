import 'package:flutter/material.dart';

class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  _DraggableScrollableSheetPageState createState() =>
      _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState
    extends State<DraggableScrollableSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggableScrollableSheet'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'images/beauty.jpg',
              width: 200,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(10)),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('嘤嘤嘤'),
                    Image.asset(
                      'images/jay.jpg',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 300),
                    Text('llll'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
