import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_development/pages/login/registration.dart';
import 'authentication_error.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String login_Email = "";
  String login_Password = "";
  String infoText = "";


  //エラーメッセージを日本語化するためのクラスを実体化
  final auth_error = Authentication_error();



//  プログレスバーの表示
  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ログイン画面',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  login_Email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "パスワード(8~20)文字"),

                // パスワードが見えないようにする
                obscureText: true,
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  login_Password = value;
                },
              ),
            ),

            //ログインが失敗した時のエラーメッセージ
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.red),
              ),
            ),

            ButtonTheme(
                minWidth: 350.0,
                child: RaisedButton(
                    child: Text(
                      'ログイン',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                    color: Color.fromRGBO(252, 130, 29, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () async {
                      try {

                        final FirebaseAuth auth =FirebaseAuth.instance;
                        final  result =
                            await auth.signInWithEmailAndPassword(email: login_Email, password: login_Password);

                          showProgressDialog();
                          await Future.delayed(Duration(seconds: 1));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            Home(user_id: result.user.uid)));
                      } catch (e) {
                        setState(() {
                          print(e);
                          infoText = auth_error.login_error_msg(e.code);
                        });
                      }
                    })),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: ()=>Navigator.pop(context)),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonTheme(
            minWidth: 350.0,
            child:RaisedButton(
              child: Text('アカウントを作成する',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder:(BuildContext context) =>Registration()),
                );
              },
            )

          )


        ],

      ),
    );
  }
}
