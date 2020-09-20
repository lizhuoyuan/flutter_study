import 'package:flutter/material.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPagState createState() => _ExtensionPagState();
}

class _ExtensionPagState extends State<ExtensionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扩展函数'),
      ),
      body: Center(
        child: InkWell(
          onTap: _onTap,
          child: Text('按钮'),
        ).click(() {
          print('extension');
        }),
      ),
    );
  }

  void _onTap() {
    print('on tap');
  }
}

extension Ink on InkWell {
  InkWell click(Function f) {
    return InkWell(
      child: child,
      onTap: () {
        f();
      },
    );
  }
}
