import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandSort extends StatefulWidget {
  const HandSort({key,this.title}) : super(key: key);

  final String title;
  @override
  _HandSortState createState() => _HandSortState();
}

//モデルクラス定義
class Model{
  final String title;
  final String subTitle;
  final String key;

  Model({
    @required this.title,
    @required this.subTitle,
    @required this.key,
  });
}

class _HandSortState extends State<HandSort> {
  List<Model> modelList;

  @override

  void initState(){
    super.initState();
    modelList=[];
    List<String> titleList =["Title A","Title B","Title C"];
    List<String> subTitleList=["SubTitle A","SubTitle B","SubTitle C"];

    for(int i =0;i<3; i++){
    Model model = Model(
      title: titleList[i],
      subTitle: subTitleList[i],
      key: i.toString(),
    );
    modelList.add(model);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('並べ替え'),
      ),
      body: Container(
        child: ReorderableListView(
          padding: EdgeInsets.all(10.0),
          header: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("ここはヘッダー部分" ,style:TextStyle(fontSize: 18.0),),
            ),
          ),
//        並び替え
        onReorder:(oldIndex,newIndex){
          if(oldIndex<newIndex){
            newIndex-=1;
          }
          final Model model =modelList.removeAt(oldIndex);
          setState(() {
            modelList.insert(newIndex,model);
          });
          },
          children: modelList.map(
              (Model model){
                return Card(
                  elevation: 2.0,
                  key: Key(model.key),
                  child: ListTile(
                   leading: const Icon(Icons.people),
                   title: Text(model.title),
                   subtitle: Text(model.subTitle),
                  ),
                );
              }
          ).toList(),
        ),

      ),


    );
  }
}
