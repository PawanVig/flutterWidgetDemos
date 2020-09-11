import 'package:flutter/material.dart';

class CC_Page2 extends StatefulWidget{
final String current;
final String power;
final String voltage;
final String pf;

CC_Page2(this.current,this.power,this.voltage,this.pf);

@override
State<StatefulWidget> createState(){
  return _CC_Page2_State();
}

}

class _CC_Page2_State extends State<CC_Page2>{

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.current),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context,false)),
      ) ,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text( widget.pf ,
            style: TextStyle(fontSize: 32),
            )
          ],
          )
          )
      );
  }

}