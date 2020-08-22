import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox:按比例设置widget尺寸'),
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.grey,
            child: FractionallySizedBox(
                alignment: Alignment.bottomRight,
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: RaisedButton(
                  onPressed: () {
                    print('hhh');
                  },
                  child: Text('button'),
                )),
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.1,
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                  ),
                ),
                Image.asset(
                  'images/jay.jpg',
                  width: 50,
                ),
                SizedBox(width: 10),
                Text('文字'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
