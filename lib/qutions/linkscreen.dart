import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:maincasenet/const/constdata.dart';

class Linkscreen extends StatefulWidget {
  @override
  _LinkscreenState createState() => _LinkscreenState();
}

class _LinkscreenState extends State<Linkscreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');
    Navigator.pushReplacementNamed(context, navigate_LoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    final String? link = ModalRoute.of(context)?.settings.arguments as String?;

    if (link == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Error", style: const TextStyle(color: Colors.white)),
        ),
        body: Center(child: Text('No URL provided')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
             Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: (){Navigator.pushReplacementNamed(context, navigate_HomeScreen);},
                icon: Icon(Icons.home, color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, navigate_HomeScreen);
              },
              child: Text("Home", style: const TextStyle(color: Colors.white)),
            ),
             Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: _signOut,
                icon: Icon(Icons.logout,color: const Color.fromARGB(255, 47, 47, 47)),
              ),
            ),
           
          ],
        ),
        toolbarHeight: 50,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: WebView(
                initialUrl: link,
                javascriptMode: JavascriptMode.unrestricted,
                onWebResourceError: (error) {
                  // Handle WebView errors
                  print('WebView error: ${error.description}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
