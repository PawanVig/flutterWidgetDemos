import 'package:flutter/material.dart';
import './phase3wire4/currentCalculatorForm.dart';
import './phase3wire4/currentCalculatePage2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrentCalculator(),
      onGenerateRoute: (RouteSettings settings) {
        // /detailId/5
           final List<String> pathElements = settings.name.split("/");

           if(pathElements[0] != ""){
             return null;
           }

           switch(pathElements[1]) {
             case "current_3phase_4wire" :
                    final String current = pathElements[2];
                     return MaterialPageRoute(
                       builder: (BuildContext) => CC_Page2(
                         pathElements[2],pathElements[3],pathElements[4],pathElements[5]),
                     );
             default:
                return null;
            //  case "feed" :
            //          return MaterialPageRoute(
            //            builder: (BuildContext) => FeedPage(),
            //          );

            //  case "detailId":
            //        final String detailId = pathElements[2];  
            //        // /detailId/5
            //        // [0]/[1]/[2]
            //        print("DetailId: $detailId")  ;

            //        String itemName = "Item Detail: $detailId";

            //        if(detailId.isEmpty)
            //        {return MaterialPageRoute(
            //          builder: (BuildContext)=> DetailPage("No Detail"));
            //          }
            //          return MaterialPageRoute(
            //          builder: (BuildContext)=> DetailPage(itemName));

            
           }
      },
    );
  }
}

