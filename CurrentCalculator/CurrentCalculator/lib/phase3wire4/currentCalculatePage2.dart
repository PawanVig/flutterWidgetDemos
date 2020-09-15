import 'package:flutter/material.dart';
import 'dart:math';

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
TextEditingController transformerSizeController = new TextEditingController();
TextEditingController proposedPtSizeController = new TextEditingController();
TextEditingController proposedCtSizeController = new TextEditingController();

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

int transformerSize(double current_val, double voltage_val)
{

      return (sqrt(3)*voltage_val*current_val).round();

}

String purposedPtSize(double voltage_val)
{
  if(voltage_val == 208)
  {
    return "No PT required";
  }
  else if(voltage_val == 600)
  {
    return "360:120 PT Required";
  }

}

String purposedCTSize(double current_val)
{
 if(current_val <= 405 ){
   return "200:5";
 }
 else if(current_val <= 450 && current_val>405 ){
   return "300:5";
 }
 else if(current_val <=800 && current_val>450 ){
   return "400:5";
 }
 else if(current_val <=900 && current_val>800 ){
   return "600:5";
 }
 else if(current_val <=1600 && current_val>900 ){
   return "800:5";
 }
 else if(current_val <=3000 && current_val>1600 ){
   return "1500:5";
 }
 else
 {
   return "Please Contact Meter Tech";
 }
 
}
  

@override
  Widget build(BuildContext context){

    voltscontroller.text = widget.voltage.toString();
    double current_val = double.parse(widget.current.toString());
    double voltage_val = double.parse(widget.voltage.toString());
    int pss= proposed_service_size(current_val);
    purposedServiceSizeController.text = pss.toString();
    currentcontroller.text = widget.current.toString();

    transformerSizeController.text = transformerSize(current_val,voltage_val).toString();

    proposedPtSizeController.text = purposedPtSize(voltage_val);
    proposedCtSizeController.text = purposedCTSize(current_val);



    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Current Calculator"),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context,false)),
      ) ,
      body: ListView(            
                   children: [         Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[ TextField(
          decoration: InputDecoration(
          labelText: "Current ",labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: currentcontroller,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Voltage ", labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400) ),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: voltscontroller,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Purposed Service Size ", labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: purposedServiceSizeController,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Transformer Size", labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: transformerSizeController,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Purposed PT Size",labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: proposedPtSizeController,
          enabled:false
          ),
          TextField(
          decoration: InputDecoration(labelText: "Purposed CT Size", labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25.0),
          controller: proposedCtSizeController,
          enabled:false
          )

             
          ],
          )
          )
          ]
      )
    );
  }

}