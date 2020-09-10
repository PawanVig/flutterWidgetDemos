import 'package:flutter/material.dart';

class CurrentCalculator extends StatefulWidget{

State<StatefulWidget> createState(){
  return CurrentCalculatorState();
}

}

class CurrentCalculatorState extends State<CurrentCalculator>{

  String _power;
  String _voltage;
  String _pf;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildPower()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: "Power in KW:"),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value){
        double power = double.tryParse(value);

        if(power == null || power <=0){
          return 'Power Must be greater than 0';
        }

        return null;


      },

      onSaved: (String value){
        _power = value;
      },
      );
  }

  Widget _buildPf()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: "Power Factor (0,1] :"),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value){
        double pf = double.tryParse(value);

        if(pf == null || pf <=0){
          return 'Power Factor Must be greater than 0';
        }
        else if(pf>1){
          return 'Power Factor Must be between 0 and 1';
        }

        return null;


      },

      onSaved: (String value){
        _pf = value;
      },
      );
  }


  Widget _buildVoltage()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter Voltage:"),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (String value){
        double pf = double.tryParse(value);

        if(pf == null || pf <=0){
          return 'Voltage Must be greater than 0';
        }
        

        return null;


      },

      onSaved: (String value){
        _voltage = value;
      },
      );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Current Calculator"),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPower(),
              _buildVoltage(),
              _buildPf(),
              SizedBox(height: 100,),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.blue, fontSize: 16)
                ),
                onPressed:() {
                  if(!_formkey.currentState.validate()){
                    return;
                  }

                  _formkey.currentState.save();

                  print("power is $_power ");
                  print("pf is $_pf ");
                  print("voltage is $_voltage ");
                  Navigator.pushNamed(context, "/current_3phase_4wire/$_power");

                }
              )

            ]
          ),
        )
      ),
    );

  }
}