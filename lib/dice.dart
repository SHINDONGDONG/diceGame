import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int _leftDice =1 ;
  int _rightDice = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset('image/dice$_leftDice.png')
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                      child: Image.asset('image/dice$_rightDice.png')
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0,),
            ButtonTheme(
              minWidth: 100,
              height: 60.0,
              child: RaisedButton(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                  color: Colors.orangeAccent,
                  onPressed: (){
                  setState(() {
                    _leftDice = Random().nextInt(6)+1;
                    _rightDice = Random().nextInt(6)+1;
                    showToast('Left Dice : $_leftDice , Right Dice : $_rightDice');
                  });
                  }),
            ),
          ],
        ),
      ),

    );
  }
}

void showToast(String msg){
  Fluttertoast.showToast(msg: msg,
  backgroundColor: Colors.white,
  toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

}