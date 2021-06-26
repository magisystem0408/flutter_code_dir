import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ユーザー情報を入力する'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('戻る'),
                onPressed: (){
                  Navigator.pop(context);
            })

          ],

        ),
      ),

    );
  }
}
