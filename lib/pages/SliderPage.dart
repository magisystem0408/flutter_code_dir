import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value =0.0;

  void _changeSlider(double e){
    setState(() {
      _value =e;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            Center(child: Text("値：${_value}")),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Slider(
                label:'{$_value}',
                min:0,
                max:10,
                value:_value,
                activeColor: Colors.orange,
                inactiveColor: Colors.blueAccent,
                divisions: 10,
                onChanged: _changeSlider,
              ),
            ),
            RaisedButton(
                child: Text('戻る'),
                onPressed: (){
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
