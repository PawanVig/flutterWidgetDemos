import 'package:flutter/material.dart';

class CC_Page2 extends StatefulWidget{
final String current;
CC_Page2(this.current);

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
            Text("Current Page 2",
            style: TextStyle(fontSize: 32),
            )
          ],
          )
          )
      );
  }

}