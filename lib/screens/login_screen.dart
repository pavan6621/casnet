
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maincasenet/const/constdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _username;
 void initState() {
   super.initState();
   
       fetchData();
    
 }
 Future<void> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   var username = prefs.getString('username');
   print("username..........................--------$username");
   if(username != null){
    setState(() {
       Navigator.pushReplacementNamed(context, navigate_HomeScreen);
      });
   }
  

 }
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return; 
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(credential);
      await _auth.signInWithCredential(credential);

      User? user = _auth.currentUser;
      setState(() {
        _username = user?.displayName ?? 'No User Name';
      });
       SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setString('username', _username!);
         var userdata = prefs.getString('username');
         print("userdata----$userdata");
      Navigator.pushReplacementNamed(context, navigate_HomeScreen);
    } catch (error) {
      print('Error during Google Sign-In: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed. Please try again.')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 130,),
                Image.asset(
                  "lib/assests/appicon512.png",
                  width: 208,
                  height: 208,
                ),
                SizedBox(height: 50,),
                Text("Login With",
                    style: GoogleFonts.workSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),),
                    const SizedBox(height: 20),

                GestureDetector(
                  onTap: _signInWithGoogle,
                  child: Center(
                    
                    child: Container(
                      width: 252.6,
                      height: 33.87,
                     color: Color(0xFF2D3747),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            SizedBox(width: 80,),
                             Image.asset(
                        "lib/assests/Google_icon.png",
                        width: 18,
                        height: 18, ),
                        SizedBox(width: 10,),
                            Text(
                          'Google',
                          style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: _signInWithGoogle,
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.red,
                //     shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
                //   ),
                //   child: Text(
                //     'Sign In with Google',
                //     style: GoogleFonts.workSans(
                //       textStyle: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:maincasenet/const/constdata.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // final TextEditingController _emailController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   String? _username;

//   @override
//   void initState() {
//     super.initState();
//     // _checkIfUserIsLoggedIn();
//   }

//   // Future<void> _checkIfUserIsLoggedIn() async {
//   //    SharedPreferences prefs = await SharedPreferences.getInstance();
//   // var value = prefs.getString('username');
//   // print("......................$value");
//   //   if (value != null) {
//   //     Navigator.pushReplacementNamed(context, navigate_HomeScreen);
//   //   }
//   // }

//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return; 
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await _auth.signInWithCredential(credential);

//       User? user = _auth.currentUser;
//       setState(() {
//         _username = user?.displayName ?? 'No Name';
//       });
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('username', _username!);
//       Navigator.pushReplacementNamed(context, navigate_HomeScreen);
//     } catch (error) {
//       print('Error during Google Sign-In: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Google Sign-In failed. Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   "lib/assests/appicon512.png",
//                   width: 208,
//                   height: 208,
//                 ),
//                 SizedBox(height: 40.0),
               
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _signInWithGoogle,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
//                   ),
//                   child: Text(
//                     'Sign In with Google',
//                     style: GoogleFonts.workSans(
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
