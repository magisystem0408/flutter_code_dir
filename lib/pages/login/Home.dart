import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_development/main.dart';

class Home extends StatelessWidget {

  final String user_id;
  const Home({Key key,this.user_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize:MainAxisSize.min ,
          children: [
            Text('マムシの世界へようこそ',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Text('君のマムシコード：'+user_id),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: (){
                Text('ホームへ戻る');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              MyApp()
              ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
