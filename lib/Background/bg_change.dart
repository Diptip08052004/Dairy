import 'package:flutter/material.dart';

class BackgroundChange extends StatefulWidget {
  @override
  _BackgroundChange createState() => _BackgroundChange();
}

class _BackgroundChange extends State<BackgroundChange> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () => _changeBackgroundColor(Colors.red),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
                
              ),
            ),
            GestureDetector(
              onTap: () => _changeBackgroundColor(Colors.blue),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () => _changeBackgroundColor(Colors.green),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            GestureDetector(
              onTap: () => _changeBackgroundColor(Colors.yellow),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
