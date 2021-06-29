import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// httpレスポンスをJSON変換する
import 'dart:convert';


class Api extends StatefulWidget {
  const Api({key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {

  Map data;
  List userData;

  Future getData() async{

    final params ={
      'page':'2'
    };
    final url = Uri.https('reqres.in','api/users',params);
    final response = await http.get(url);

    if(response.statusCode==200){
      print("APIデータを取得しました。");
        // jsonをmapオブジェクトに格納
        data = json.decode(response.body);
        setState(() {
          userData =data["data"];
          print(userData);
          // print('データ取得完了');
        });
    }else{
      throw Exception('データが取得できませんでした。');
    }
  }

  @override

    void initState(){
      super.initState();
          getData();
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('外部APIからデータ取得'),
      ),

      // スクロール可能な可変リストを作る
      body: ListView.builder(

        // 三項演算子
          itemCount: userData ==null ? 0 : userData.length,

          // 表示したい内容をindexに応じて
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(userData[index]["avatar"]),
                    ),
                  ),
                  Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}")
                ],

              ),
            );
          }),


    );
  }
}
