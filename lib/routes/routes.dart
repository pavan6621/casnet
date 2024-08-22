import 'package:flutter/material.dart';
import 'package:maincasenet/qutions/linkscreen.dart';
import 'package:maincasenet/qutions/summeryscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../qutions/main_qution.dart';
import '../qutions/program_language.dart';
import '../qutions/qution.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

  class Routes extends StatefulWidget {
  @override
  RoutesState createState() => RoutesState();
}                          
                                          
class RoutesState extends State<Routes> {
  var route ="/";
    @override
 void initState() {
   super.initState();
   
       fetchData();
    
 }
 Future<void> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   var username = prefs.getString('username');
   print("username..........................--------$username");
   if(username == null){
    setState(() {
        route = "/";
      });
   }
   else{
    setState(() {
        route = "/HomeScreen";
      });
   }

   print("routes$route");
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casnet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: route,
   
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/': (context) => SignInPage(),
        
        '/MainQution': (context) => MainQution(),
        '/ProgramLanguage': (context) => ProgramLanguage(),
        '/Qution': (context) => Qution(),
        '/Summeryscreen': (context) => Summeryscreen(),
        '/Linkscreen': (context) => Linkscreen(),
      },
    );
  }
}
