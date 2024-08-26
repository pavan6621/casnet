
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
    // Use a local variable for `value`
    var value = Globals.Summerydata.isNotEmpty
        ? Globals.Summerydata
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    if (Globals.Summerydata.isEmpty) {
      Globals.Summerydata = value;
      print("Globals.Summerydata...${Globals.Summerydata}");
    }

    final rawButtons = value['Text'] as dynamic;
    final rawLinks = value['link'] as dynamic;

    final buttons = _parseStringOrList(rawButtons);
    final links = _parseStringOrList(rawLinks);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            _buildBackButton(context),
            SizedBox(height: 35),
            _buildTitle(),
            Expanded(child: _buildButtonList(buttons, links, context)),
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  List<String> _parseStringOrList(dynamic value) {
    if (value is String) return [value];
    if (value is List) return value.cast<String>();
    return [];
  }

  Widget _buildBackButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          Globals.Summerydata.clear();
          if(Globals.imagetype == "value"){
          Navigator.pushReplacementNamed(context, navigate_ProgramLanguage,arguments:{'Text': 'data'},);
          }
          else{
             Navigator.pushReplacementNamed(context, navigate_Qution);
          }
        },
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        "Suggested Sites",
        style: GoogleFonts.workSans(
          textStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _buildButtonList(List<String> buttons, List<String> links, BuildContext context) {
    return ListView.builder(
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
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (link != null) {
                      Navigator.pushReplacementNamed(context, navigate_Linkscreen, arguments: link);
                    }
                  },
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Center(
      child: ListTile(
        title: ElevatedButton(
          onPressed: (){
            Globals.Summerydata.clear();
            Navigator.pushReplacementNamed(context, navigate_MainQution);},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF000AFF),
            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(
            "I have found the right site",
            style: GoogleFonts.workSans(
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
