import 'package:flutter/material.dart';
import 'package:flutter_development/pages/BottomSheets.dart';
import 'package:flutter_development/pages/Dialog.dart';
import 'package:flutter_development/pages/Form.dart';
import 'package:flutter_development/pages/HandSort.dart';
import 'package:flutter_development/pages/ListDelete.dart';
import 'package:flutter_development/pages/SliderPage.dart';
import 'package:flutter_development/pages/TabBar_TabBarView.dart';
import 'package:flutter_development/pages/Toggle.dart';
import 'package:flutter_development/pages/api/Api.dart';
import 'package:flutter_development/pages/login/login.dart';
import 'pages/ProgressBar.dart';
import 'pages/ImagePage.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String ,WidgetBuilder>{
        '/':(context) => MyHomePage(),
        '/image':(context)=> ImagePage(),
        '/tabber':(context)=> TabBer(),
        '/forms':(context) => Forms(),
        '/userform':(context) => Login(),
        '/toggle':(context) => Toggle(),
        '/slider':(context) => SliderPage(),
        '/api':(context) => Api(),
        '/progressbar':(context) =>ProgressBar(),
        '/dialog':(context) => DialogPage(),
        '/bottomsheets':(context)=> ButtonSheats(),
        '/handsort':(context)=> HandSort(),
        '/listdelete':(context) => ListDelete(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('マムシのディレクトリ'),
        actions: <Widget>[
          Icon(Icons.nat)

        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          // ここで中央による
          // 上によるのか真ん中によるのかcenterによるのか
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                  child: Text('タブバーページ'),
                  onPressed: () async{
                          await Navigator.pushNamed(context, '/tabber');}),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('画像ページ'),
                    onPressed: () async{
                        await Navigator.pushNamed(context, '/image');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('フォームテキストバインド'),
                      onPressed:() async{
                        await Navigator.pushNamed(context, '/forms');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('ユーザー登録'),
                      onPressed: () async{
                        await Navigator.pushNamed(context, '/userform');
                      },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('いいねボタン'),
                      onPressed: () async{
                          await Navigator.pushNamed(context, '/toggle');
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('スライダー'),
                      onPressed: () async{
                        final result =await Navigator.pushNamed(context, '/slider');
                        print(result);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('API'),
                      onPressed:() async{
                      await Navigator.pushNamed(context, '/api');
                  } ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text("プログレスバー"),
                      onPressed: () async{
                    await Navigator.pushNamed(context, '/progressbar');
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child:Text("ダイアログ"),
                      onPressed: () async{
                    await Navigator.pushNamed(context, '/dialog');
                  }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text("ボトムシート"),
                      onPressed: ()async{
                    await Navigator.pushNamed(context, '/bottomsheets');
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('並べかえ'),
                      onPressed: () async{
                    await Navigator.pushNamed(context, '/handsort');
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Text('リストアニメーション削除'),
                      onPressed: () async{
                    await Navigator.pushNamed(context, '/listdelete');

                  }),
                )
              ],




          ),





        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
