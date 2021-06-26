import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  const Toggle({key}) : super(key: key);

  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool _active =false;
  
  
  //スイッチを記述
  //状態を保持する変数の処理はsetState内に記述する
  void _changeSwitch(bool e){
    setState(() {
      _active =e;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,       
          children: <Widget>[
            Center(
              child: Icon(
                Icons.thumb_up,
                color: _active ? Colors.orange:Colors.grey,
                size: 100.0,
              ),
            ),
            Switch(value: _active, onChanged: _changeSwitch),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: (){
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
