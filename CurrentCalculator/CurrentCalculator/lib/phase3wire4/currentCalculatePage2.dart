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
TextEditingController currentcontroller = new TextEditingController();
TextEditingController purposedServiceSizeController = new TextEditingController();

int proposed_service_size(double current_val){

  double i=110;
  int proposed_service_size=100;
   if(current_val<=110)
     {  print("returning from if proposed_service_size = $proposed_service_size");
       return proposed_service_size;
     }

  for(;;i=i+100)
  { print("in loop of proposed_service_size i= $i");
    print("in loop of proposed_service_size = $proposed_service_size");
    proposed_service_size=proposed_service_size+100;

    if((current_val>i) && (current_val<=(i+100)) )
    {
      print("returning from loop proposed_service_size = $proposed_service_size");
      return proposed_service_size;
    }
    
  }

}
  

@override
  Widget build(BuildContext context){

    voltscontroller.text = widget.voltage.toString();
    double current_val = double.parse(widget.current.toString());
    int pss= proposed_service_size(current_val);
    purposedServiceSizeController.text = pss.toString();
    currentcontroller.text = widget.current.toString();
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
          children: <Widget>[ TextField(
          decoration: InputDecoration(labelText: "Current "),
          controller: currentcontroller,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Voltage "),
          controller: voltscontroller,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Puposed Service Size "),
          controller: purposedServiceSizeController,
          enabled:false
          )

             
          ],
          )
          )
      );
  }

}