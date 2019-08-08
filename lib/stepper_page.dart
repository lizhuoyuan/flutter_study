/*
 * author: Created by 李卓原 on 2019/8/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep;
  List<String> _list;

  @override
  void initState() {
    super.initState();
    _currentStep = 0;
    _list = [];
    for (int i = 0; i < 5; i++) {
      _list.add('title:$i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper（步骤条）'),
      ),
      body: Container(
          child: Stepper(
        steps: _list
            .map((item) => Step(
                title: Text(item),
                content: SizedBox(),
                isActive: _currentStep == _list.indexOf(item)))
            .toList(),
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepCancel: stepCancel,
        onStepContinue: stepContinue,
        onStepTapped: stepTapped,
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Container(
            /*width: double.infinity,
            color: Colors.blue,
            child: RaisedButton(
              child: Text('next'),
              onPressed: onStepContinue,
            ),*/
          );
        },
      )),
    );
  }

  void stepCancel() {
    setState(() {
      _currentStep = 0;
    });
  }

  void stepContinue() {
    if (_currentStep < _list.length - 1)
      setState(() {
        _currentStep++;
      });
  }

  void stepTapped(int i) {
    setState(() {
      _currentStep = i;
    });
  }
}
