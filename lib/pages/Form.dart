import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  // @override
  String _text = '';

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
                  color:Colors.blueAccent,
                  fontSize: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  style: TextStyle(color: Colors.red),
                  onChanged: _handleText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ここに何か入力してください'
                  ),
                ),
              ),RaisedButton(
                  child: Text('戻る'),
                  onPressed:(){
                    Navigator.pop(context);
                  }
              ),

            ],
          ),
        )
    );
  }
}
