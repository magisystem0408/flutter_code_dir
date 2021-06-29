import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSheats extends StatefulWidget {
  const ButtonSheats({key}) : super(key: key);

  @override
  _ButtonShetsState createState() => _ButtonShetsState();
}

class _ButtonShetsState extends State<ButtonSheats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               RaisedButton(
                  child: Text('シートボタンを確認する'),
                  onPressed: () async{
                    await showModalBottomSheet(context: context,
                        builder: (BuildContext context){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text('音楽'),
                              onTap: ()=> Navigator.of(context).pop(1),
                            ),
                            ListTile(
                              leading: Icon(Icons.videocam),
                              title: Text('ビデオ'),
                              onTap: ()=> Navigator.of(context).pop(2),
                            ),
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text('写真'),
                              onTap: ()=> Navigator.of(context).pop(3),
                            )
                          ],
                        );
                    });
                  }),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: ()=> Navigator.of(context).pop(0)),
            )
          ],

        ),
      ),
    );
  }
}
