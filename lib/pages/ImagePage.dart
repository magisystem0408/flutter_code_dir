import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画像を表示する'),
      ),
      body: Column(
        children: [
          Center(
            child: Column(children: [
              Image.network('https://res.cloudinary.com/dnmwe1whf/image/upload/v1624183852/sample.jpg'),
              RaisedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
