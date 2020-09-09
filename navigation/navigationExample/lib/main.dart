import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/feed.dart';
import './pages/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      // routes: {
      //   '/login' : (context) => LoginPage(),
      //   '/feed' : (context) => FeedPage(),
      //   '/detail' : (context) => DetailPage(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        // /detailId/5
           final List<String> pathElements = settings.name.split("/");

           if(pathElements[0] != ""){
             return null;
           }

           switch(pathElements[1]) {
             case "login" :
                     return MaterialPageRoute(
                       builder: (BuildContext) => LoginPage(),
                     );
             case "feed" :
                     return MaterialPageRoute(
                       builder: (BuildContext) => FeedPage(),
                     );
             case "detailId":
                   final String detailId = pathElements[2];  
                   // /detailId/5
                   // [0]/[1]/[2]
                   print("DetailId: $detailId")  ;

                   String itemName = "Item Detail: $detailId";

                   if(detailId.isEmpty)
                   {return MaterialPageRoute(
                     builder: (BuildContext)=> DetailPage("No Detail"));
                     }
                     return MaterialPageRoute(
                     builder: (BuildContext)=> DetailPage(itemName));

                     default:
                        return null;
           }
      },
    );
  }
}


