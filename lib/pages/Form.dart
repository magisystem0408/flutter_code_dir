import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  // @override
  String _text = '';
  final myFocusNode = FocusNode();

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$_text",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              // キーボードが勝手に開く autofocus
              autofocus: true,
              style: TextStyle(color: Colors.red),

              // バンドル
              onChanged: _handleText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ここに何か入力してください',
                hintText: '入力するとバインドされます',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              focusNode: myFocusNode,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ボタンを押すとここのテキストフィールドがフォーカスされます'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: RaisedButton(
                child: Text('フォーカスさせるボタン'),
                onPressed: () {
                  myFocusNode.requestFocus();
                }),
          ),

          RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    ));
  }
}
