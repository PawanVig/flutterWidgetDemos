import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Power Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Power Calculator'),
        ),

        body : ListView(            
                   children: [            
                     PowerCalculator()       
                   ]
        )
      )




        // body: Center(
        //   child: PowerCalculator(),
        // ),
      
    );
  }
}

class PowerCalculator extends StatefulWidget {
  @override
  _PowerCalculator createState() => _PowerCalculator();
}

class _PowerCalculator extends State<PowerCalculator> {
 TextEditingController powercontroller = new TextEditingController();
 TextEditingController voltscontroller = new TextEditingController();
 TextEditingController pfcontroller = new TextEditingController();
 String result = "0";
 @override
  Widget build(BuildContext context) {
  return Container(
      child: Column(
        children: <Widget>[
         Row(
            children: <Widget>[
              new Text(
            "Power in KW",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black
            )
            )
            ]
         ),
              Row(
                children: <Widget>[
                new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: powercontroller,
                ),
              ),
              ]
          )
          ,
          Row(
            children: <Widget>[
              new Text(
            "Voltage",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black
            )
            )
            ]
         ),
              Row(
                children: <Widget>[
                new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: voltscontroller,
                ),
              ),
              ]
          ),
          Row(
            children: <Widget>[
              new Text(
            "power Factor",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black
            )
            )
            ]
         ),
              Row(
                children: <Widget>[
                new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: pfcontroller,
                ),
              ),
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Calculate Current"),
                onPressed : () {
                  setState(() {
                    //current 
                    double power = double.parse(powercontroller.text);
                    double voltage= double.parse(voltscontroller.text);
                    double pf= double.parse(pfcontroller.text);
                    if(pf== 0){  result = "Power Factor cannot be Zero";}
                    else if(pf>1){  result = "Power Factor cannot be >1";}
                    else{
                    double current = (power * 1000) /( sqrt(3) * voltage * pf );
                    result = current.toStringAsFixed(2);
                    }
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Current(in Ampere) :",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              
              )),
               new Flexible(
                child: Text(result,
                 style: TextStyle(
                  fontSize: 30,
               ),
               ),  
               )            

          ]
      )
        ]
      )
      );
      

      
  }
 
}










// ///////////////////////////////////////////////////////////////////////////////
// // Define a custom Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// // Define a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
// //TextEditingController inp1Controller = new TextEditingController();
// //TextEditingController inp2Controller = new TextEditingController();
// //String result = "0";
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a `GlobalKey<FormState>`,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           Text("Number 1:"),
//           //TextFormFields Starts
//           TextFormField( 
//   // The validator receives the text that the user has entered.
//   validator: (value) {
//     if (value.isEmpty) {
//       return 'Please enter some text';
//     }
    
//     return null;
//   },
// ),

// RaisedButton(
//   onPressed: () {
//     // Validate returns true if the form is valid, otherwise false.
//     if (_formKey.currentState.validate()) {
//       // If the form is valid, display a snackbar. In the real world,
//       // you'd often call a server or save the information in a database.

//       Scaffold
//           .of(context)
//           .showSnackBar(SnackBar(content: Text('Processing Data')));
//     }
//   },
//   child: Text('Submit'),
// )
//               // Add TextFormFields and RaisedButton here.
//         ]
//      )
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////////////


// TapboxA manages its own state.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

