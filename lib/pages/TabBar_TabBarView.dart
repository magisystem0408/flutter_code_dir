import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBer extends StatefulWidget {
  @override
  _TabBerState createState() => _TabBerState();
}

class _TabBerState extends State<TabBer> {
  final _tab = <Tab>[
    Tab(text: "猫", icon: Icon(Icons.remove_red_eye)),
    Tab(text: "ちみ", icon: Icon(Icons.read_more)),
    Tab(text: 'マムシ', icon: Icon(Icons.radar_rounded)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: _tab.length, child: Scaffold(
      appBar: AppBar(
        title: const Text("ネコニナリソウ"),
        bottom: TabBar(
          tabs: _tab,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          TabPage(title: "てぃみねこニャンコ", icon: Icons.directions_railway),
          TabPage(title: "てぃみねこ", icon: Icons.directions_subway),
          TabPage(title: "ニャンコ", icon: Icons.directions_walk),


        ],
      ),

    ));
  }
}

class TabPage extends StatelessWidget{
  final IconData icon;
  final String title;

  const TabPage({Key key,this.icon,this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =Theme.of(context).textTheme.headline4;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,size: 72.0,color: textStyle.color),
            Text(title,style: textStyle),
          ],
        ),
      );
  }}
