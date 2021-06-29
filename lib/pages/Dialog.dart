import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('ダイアログを表示する'),
              onPressed: ()async{
                var result = await showDialog<int>(
                    context: context,
                    barrierDismissible: false,
                    builder:(BuildContext context){
                      return AlertDialog(
                        title: Text('ここにテーマが入る'),
                        content: Text('確認のダイアログです'),
                        actions: <Widget>[
                          RaisedButton(
                              child: Text('キャンセル'),
                              onPressed: ()=> Navigator.of(context).pop(0)),
                          RaisedButton(
                              child: Text('完了'),
                              onPressed: ()=> Navigator.of(context).pop(1)),
                        ],
                      );
                    }
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: ()=> Navigator.pop(context)),
            )
          ],
        ),
      ),

    );
  }
}
