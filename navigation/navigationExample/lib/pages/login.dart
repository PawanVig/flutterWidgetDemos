import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPage();

  @override
  State<StatefulWidget> createState(){
     return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{

  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Coding with Pawan',
              style: TextStyle(fontSize: 32),
            ),
            RaisedButton(
              child: Text("Go to feed"),
              onPressed: () => {Navigator.pushNamed(context, '/feed')},
            )
          ],
        )
      ),
    );
  }
  
}