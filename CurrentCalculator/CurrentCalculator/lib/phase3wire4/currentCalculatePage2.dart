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

TextEditingController voltscontroller = new TextEditingController();
  
  bool _enabled = false;
  

@override
  Widget build(BuildContext context){

    voltscontroller.text = widget.voltage.toString();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Current Calculator"),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context,false)),
      ) ,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[ new TextField(
          decoration: InputDecoration(labelText: "Voltage "),
          controller: voltscontroller,
          enabled:false
    
  )

            // new TextFormField(
            //   controller: voltscontroller,
            //   style: theme.textTheme.subhead.copyWith(
            //     color: theme.disabledColor,
            //   ),
            //   decoration: new InputDecoration(
            //     hintText: _enabled ? 'Type something' : '',
            //   ),
            // )
          ],
          )
          )
      );
  }

}