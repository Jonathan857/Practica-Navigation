import 'package:flutter/material.dart';
import 'package:navigation_flutter/src/pages/alert_page.dart';
import 'package:navigation_flutter/src/rut/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      }
      );
  }
}