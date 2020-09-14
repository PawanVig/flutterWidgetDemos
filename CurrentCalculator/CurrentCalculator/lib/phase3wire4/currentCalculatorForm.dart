import 'package:flutter/material.dart';
import 'dart:math';

class CurrentCalculator extends StatefulWidget{

State<StatefulWidget> createState(){
  return CurrentCalculatorState();
}

}

class CurrentCalculatorState extends State<CurrentCalculator>{

  String _power;
  String _voltage;
  String _pf;

  List<String> _voltage_3phase4wire = <String>['','120/208', '347/600'];
  String _selected_voltage = '';

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

Widget _buildVoltage2()
  {
    return new FormField<String>(
  builder: (FormFieldState<String> state) {
    return InputDecorator(
      decoration: InputDecoration(
        //icon: const Icon(Icons.power),
        labelText: 'Voltage',
        errorText: state.hasError ? state.errorText : null,
      ),
      isEmpty: _selected_voltage == '',
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: _selected_voltage,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              
              _selected_voltage = newValue;
              state.didChange(newValue);
            });
          },
          items: _voltage_3phase4wire.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
     ),
    );
  },
  validator: (val) {
    print("in validator");
    return val != '' ? null : 'Please select a Voltage';
  },
  onSaved: (String value){
    //'120/121', '120/240'
    print("in saved");
      if(value == "120/208")
       { _voltage = "208";}
        else if(value == "347/600")
        { _voltage= "600";}
      }


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
      body: ListView(            
                   children: [         Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPower(),
              _buildVoltage2(),
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
                  double power= double.parse(_power);
                  double voltage= double.parse(_voltage);
                  double pf= double.parse(_pf);
                  double current = (power * 1000) /( sqrt(3) * voltage * pf );
                  String result_current = current.toStringAsFixed(2);
                  Navigator.pushNamed(context, "/current_3phase_4wire/$result_current/$power/$voltage/$pf");

                }
              )

            ]
          ),
        )
      ),   
                             
                              ]         
                    )
    );

  }
}