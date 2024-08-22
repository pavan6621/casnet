
// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
// import '../const/constdata.dart';

// class Summeryscreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     final List<dynamic> buttons = (value?['Text'] as List?)?.cast<String>() ?? [];
//     final List<dynamic> links = (value?['link'] as List?)?.cast<String>() ?? [];

//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              SizedBox(height: 35),
//                         Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 onPressed: (){Navigator.pushReplacementNamed(context, navigate_MainQution);} ,
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//               ),),
//             SizedBox(height: 35,),
//             Center(
//               child: Text(
//                 "Suggested Sites",
//             style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),
//               ),
//             ),
//             Flexible( 
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: buttons.length,
//                 itemBuilder: (context, index) {
//                   final button = buttons[index];
//                   final link = links.length > index ? links[index] : null;
//                   return ListTile(
//                     title:Container(
//   height: 70,
//   color: Color(0xFF212121), 
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       SizedBox(width: 15,),
//       Expanded(
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             button,
//             style: GoogleFonts.workSans(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//       IconButton(
//         onPressed: () {
//  Navigator.pushReplacementNamed( context,navigate_Linkscreen,  arguments: link, );
//         },
//         icon: Icon(
//           Icons.arrow_forward,
//           color: Colors.white, 
//         ),
//       ),
//     ],
//   ),
// ),

//                   );
//                 },
//               ),
//             ),
//            Center(
//   child: ListTile(
//     title: Container(
      
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, navigate_MainQution);
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF000AFF),
//           shape: ContinuousRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//         ),
//         child: Text(
//           "I have found the right site",
//           style: GoogleFonts.workSans(
//             textStyle: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ),
//   ),
// ),

//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/constdata.dart';

class Summeryscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    print("Arguments value: $value");

    final dynamic rawButtons = value?['Text'];
    final dynamic rawLinks = value?['link'];

    print("Raw buttons before casting: $rawButtons");
    print("Raw links before casting: $rawLinks");

    final List<String> buttons = (rawButtons is String) 
        ? [rawButtons] 
        : (rawButtons is List ? rawButtons.cast<String>() : []);
    final List<String> links = (rawLinks is String) 
        ? [rawLinks] 
        : (rawLinks is List ? rawLinks.cast<String>() : []);

    print("Buttons after casting: $buttons");
    print("Links after casting: $links");

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () { Navigator.pushReplacementNamed(context, navigate_Qution); },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            SizedBox(height: 35),
            Center(
              child: Text(
                "Suggested Sites",
                style: GoogleFonts.workSans(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  final button = buttons[index];
                  final link = links.isNotEmpty ? links[index] : null;
                  return ListTile(
                    title: Container(
                      height: 70,
                      color: Color(0xFF212121),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 15),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                button,
                                style: GoogleFonts.workSans(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (link != null) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  navigate_Linkscreen,
                                  arguments: link,
                                );
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ListTile(
                title: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, navigate_MainQution);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000AFF),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      "I have found the right site",
                      style: GoogleFonts.workSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
