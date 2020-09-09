import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget{
  FeedPage();

@override
  State<StatefulWidget> createState(){
    return _FeedPageState();
  }
}

Widget _buildNavigationButton(
BuildContext context, String buttonText,String routeString){
  return RaisedButton(
    child: Text(buttonText),
    onPressed: () => Navigator.pushNamed(context, routeString),
  );
}

class _FeedPageState extends State<FeedPage>{

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Feed"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Feed Page",
          style: TextStyle(fontSize: 32),
          
          ),
          _buildNavigationButton(context,"Go to detail","/detailId/"),
          _buildNavigationButton(context,"Go to detail/1","/detailId/1"),
          _buildNavigationButton(context,"Go to detail/2","/detailId/2"),
         

        ],
        ) 
        )
  );
}

}