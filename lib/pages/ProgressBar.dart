import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  @override
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("インジーケーター　テスト"),
      ),

      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                RaisedButton(
                    child: Text('表示する'),
                    onPressed: () async{

                      showProgressDialog();
                      // 3秒間処理がストップする
                      await Future.delayed(Duration(seconds: 3));

                      //3秒後にダイアログが閉じる
                      Navigator.of(context).pop();
                    })


              // Divider(),

              //進行状況が不明確になる
              // LinearProgressIndicator(),
              // CircularProgressIndicator(),

            ],

          ),
        ),


      ),


    );
  }
}
