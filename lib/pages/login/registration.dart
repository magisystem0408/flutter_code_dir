import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_development/pages/login/authentication_error.dart';

import 'Home.dart';

class Registration extends StatefulWidget {
  const Registration({key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String newEmail = "";
  String newPassword = "";
  String infoText = "";
  bool pswd_OK;

  final auth_error = Authentication_error();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.5, 30.0),
              child: Text(
                '新規アカウントの作成',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  newEmail = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "パスワード(8~20文字)"),
                obscureText: true,
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  if (value.length >= 8) {
                    newPassword = value;
                    pswd_OK = true;
                  } else {
                    pswd_OK = false;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.red),
              ),
            ),
            ButtonTheme(
                minWidth: 350.0,
                // height: 100.0,
                child: RaisedButton(
                  child: Text(
                    '登録',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async{
                    if(pswd_OK){
                      try{
                        final FirebaseAuth auth =FirebaseAuth.instance;
                        final UserCredential result =
                            await auth.createUserWithEmailAndPassword(email: newEmail, password: newPassword);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        Home(user_id:result.user.uid)));

                      }catch(e){
                        setState(() {
                          infoText=auth_error.register_error_msg(e.code);
                        });
                      }
                    }else{
                      setState(() {
                        infoText='パスワードは8文字以上';
                      });
                    }

                  },
                ))
          ],
        ),
      ),
    );
  }
}
