

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../const/constdata.dart';
// // import '../const/line_painter_widget.dart';

// class MainQution extends StatefulWidget {
//   @override
//   _MainQutionState createState() => _MainQutionState();
// }

// class _MainQutionState extends State<MainQution> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
  
//   List<String> imageUrls = [
//     maincloud,
//     cloud1,
//     cloud1,
//   ];
//   Future<void> _signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.remove('username');
     
//     Navigator.pushReplacementNamed(context, navigate_LoginScreen);
//   }
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Container(
//         color: Color.fromARGB(255, 9, 9, 9),
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 50,),
//                  Align(
//               alignment: Alignment.centerRight,
//               child: IconButton(
//                 onPressed: _signOut,
//                 icon: Icon(Icons.logout,color:Colors.white,),
//               ),
//             ),
//                   Column(
//                     children: [
//                       Text("What is your", style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),),
//                       Text("Interest", style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),),
//                     ],
//                   ),
//                   SizedBox(height: 20,),
//                GestureDetector(
//                     onTap: () async {
//                       setState(() {
//                   Globals.dataQ ="data";
//                       });
//                   print("Globals.dataQGlobals.dataQ${Globals.dataQ}");
//                   Globals.remo();
//                       Navigator.pushReplacementNamed(context,navigate_Qution);
//                     },
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(
//                           imageUrls[2],
//                           width: 270,
//                           height: 114,
//                         ),
//                          Positioned.fill(
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Volunteering/',
//                                   style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//                                 ),
//                                 Text(
//                                   'Community Service',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Color.fromARGB(255, 255, 254, 254),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),SizedBox(height: 70,),
//                 GestureDetector(
//                     onTap: () async {
//                    setState(() {
//                   Globals.dataQ ="data1";
//                       });
//                   print("Globals.dataQGlobals.dataQ${Globals.dataQ}");
//                   Globals.remo();
//                       Navigator.pushReplacementNamed(context,navigate_Qution);
//                     },
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(
//                           imageUrls[2],
//                           width: 270,
//                           height: 114,
//                         ),
//                          Positioned.fill(
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Courses/',
//                                   style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//                                 ),
//                                 Text(
//                                   'Internship',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Color.fromARGB(255, 255, 254, 254),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),SizedBox(height: 70,),
//                   GestureDetector(
//                      onTap: () async {
//                    setState(() {
//                   Globals.dataQ ="data2";
//                       });
//                   print("Globals.dataQGlobals.dataQ${Globals.dataQ}");
//                   Globals.remo();
//                       Navigator.pushReplacementNamed(context,navigate_Qution);
//                     },
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(
//                           imageUrls[2],
//                           width: 270,
//                           height: 114,
//                         ), Positioned.fill(
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Choose your',
//                                   style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//                                 ),
//                                 Text(
//                                   'desired opprtunity',
//                                   style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//       ),
//     );
//   }
// }








import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Assuming these constants and methods are defined in your project
import '../const/constdata.dart';
// import '../const/line_painter_widget.dart';

class MainQution extends StatefulWidget {
  @override
  _MainQutionState createState() => _MainQutionState();
}

class _MainQutionState extends State<MainQution> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> imageUrls = [
    maincloud,
    cloud1,
    cloud1,
  ];

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');

      Navigator.pushReplacementNamed(context, navigate_LoginScreen);
    } catch (e) {
      print("Error signing out: $e");
      // Optionally, you can show an error message to the user
    }
  }

  Widget buildOptionCard(String title1, String title2, String dataKey) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          Globals.dataQ = dataKey;
        });
        print("Globals.dataQ: ${Globals.dataQ}");
        Globals.remo();
        Navigator.pushReplacementNamed(context, navigate_Qution);
      },
      child: Stack(
        children: <Widget>[
          Image.asset(
            imageUrls[2],
            width: 270,
            height: 114,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title1,
                    style: GoogleFonts.workSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 254, 254),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 9, 9, 9),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: _signOut,
                  icon: Icon(Icons.logout, color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    "What is your",
                    style: GoogleFonts.workSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    "Interest",
                    style: GoogleFonts.workSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildOptionCard('Volunteering/', 'Community Service', 'data'),
              SizedBox(height: 70),
              buildOptionCard('Courses/', 'Internship', 'data1'),
              SizedBox(height: 70),
              buildOptionCard('Choose your', 'desired opportunity', 'data2'),
            ],
          ),
        ),
      ),
    );
  }
}
