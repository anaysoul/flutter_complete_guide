import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer chosen!');
  }

  @override // decorator provided by dart
  Widget build(BuildContext context) {
    var questions = [
      'What is your favorite color?',
      'What is your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ), // AppBar
        body: Column(
          children: [
            Text('The question!'),
            RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion),
            RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print('Answer 2 chosen!')),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                print('Answer 3 chosen!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
