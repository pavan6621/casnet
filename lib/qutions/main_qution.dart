import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/constdata.dart';
import '../const/line_painter_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
    await _auth.signOut();
    await _googleSignIn.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');
     
    Navigator.pushReplacementNamed(context, navigate_LoginScreen);
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
                SizedBox(height: 50,),
                 Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: _signOut,
                icon: Icon(Icons.logout,color:Colors.white,),
              ),
            ),
                  Column(
                    children: [
                      Text("What is your", style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),),
                      Text("Interest", style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),),
                    ],
                  ),
                  SizedBox(height: 20,),
               GestureDetector(
                    onTap: () async {
                  Globals.dataQ ="data";
                  Globals.remo();
                      Navigator.pushReplacementNamed(context,navigate_Qution);
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
                                  'Volunteering/',
                                  style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
                                ),
                                Text(
                                  'Community Service',
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
                  ),SizedBox(height: 70,),
                GestureDetector(
                    onTap: () async {
                  Globals.dataQ ="data1";
                  
                  Globals.remo();
                      Navigator.pushReplacementNamed(context,navigate_Qution);
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
                                  'Courses/',
                                  style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
                                ),
                                Text(
                                  'Internship',
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
                  ),SizedBox(height: 70,),
                  GestureDetector(
                     onTap: () async {
                  Globals.dataQ ="data2";
                  Globals.remo();
                      Navigator.pushReplacementNamed(context,navigate_Qution);
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          imageUrls[2],
                          width: 270,
                          height: 114,
                        ), Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Choose your',
                                  style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
                                ),
                                Text(
                                  'desired opprtunity',
                                  style: GoogleFonts.workSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';

// import '../const/constdata.dart';

// class MainQution extends StatefulWidget {
//   @override
//   _MainQutionState createState() => _MainQutionState();
// }

// class _MainQutionState extends State<MainQution> {

//   final List<String> imageUrls = [
//     maincloud,
//     cloud1,
//     cloud1,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: const Color.fromARGB(255, 9, 9, 9),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 const Text(
//                   "What is your",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Color.fromARGB(255, 255, 254, 254),
//                   ),
//                 ),
//                 const Text(
//                   "Interest",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Color.fromARGB(255, 255, 254, 254),
//                   ),
//                 ),
//                 Image.asset(
//                   imageUrls[0],
//                   width: 250,
//                   height: 250,
//                 ),
//                 _buildOption(
//                   context,
//                   imageUrls[1],
//                   ['Courses/', 'Internship'],
//                   navigate_Qution,
//                 ),
//                 _buildOption(
//                   context,
//                   imageUrls[2],
//                   ['Choose your', 'desired opportunity'],
//                   navigate_Qution,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOption(BuildContext context, String imageUrl, List<String> texts, String route) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushReplacementNamed(context, route);
//       },
//       child: Stack(
//         children: <Widget>[
//           Image.asset(
//             imageUrl,
//             width: 250,
//             height: 250,
//           ),
//           Positioned.fill(
//             child: Align(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: texts.map((text) => Text(
//                   text,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Color.fromARGB(255, 255, 254, 254),
//                   ),
//                 )).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
