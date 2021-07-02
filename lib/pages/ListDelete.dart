import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDelete extends StatefulWidget {
  const ListDelete({key}) : super(key: key);

  @override
  _ListDeleteState createState() => _ListDeleteState();
}

class _ListDeleteState extends State<ListDelete> {
  final List<Map<String, dynamic>> items = [
    { "title" : "Title A",  "content" : "Content 1" },
    { "title" : "Title B",  "content" : "Content 2" },
    { "title" : "Title C",  "content" : "Content 3" }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('リストアニメーション削除'),
      ),

        // builderメソッドを使うことで動的にリストを生成することが可能
        body: ListView.builder(
          // リストにするアイテムの数を指定する
          itemCount: items.length,

          // itemBuilderでリスト生成
          //   indexはインクリメンタ
          itemBuilder: (BuildContext context,int index){
            final item =items[index];

          return Dismissible(
              // keyはシステム側で特定できるようにする
              key: Key(item["title"]),

              // onDismissedでスワイプされた時の動作を記述する
              //方向によって処理を分けることができる
              onDismissed: (direction){

                setState(() {
                  // スワイプされた要素を削除できる
                  items.removeAt(index);
                });

                // 左から右にいスワイプ
                if(direction==DismissDirection.endToStart){
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('削除しました'),
                    backgroundColor: Colors.red,
                  ));
                }
                //右から左(starttoend)
                else{
                  // snackbarで下にアイコンが出てくる
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('登録しました'),
                    backgroundColor: Colors.blue,
                  ));
                }
              },

              // 画面左から右バックグラウンド設定
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.thumb_up,color: Colors.white),
                ),

              ),
              //画面右から左バックグラウンド設定
              secondaryBackground: Container(
              //ここに背景におきたいものを設定できる
                  color: Colors.blue

              ),

              child: Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text(item["title"]+"："+item["content"]),
                ),

              ));
          }),
    );
  }
}
