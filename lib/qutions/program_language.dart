
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:maincasenet/const/constdata.dart';

// import '../const/line_painter.dart';



// class ProgramLanguage extends StatefulWidget {
//   @override
//   _ProgramLanguageState createState() => _ProgramLanguageState();
// }

// class _ProgramLanguageState extends State<ProgramLanguage> {
//  List<Offset> buttonPositions = [];
//   List<Widget> buttons = [];
//   List<String> labels = ["c", "c++", "java", "python", "react native","flutter","html"];
//   final double buttonWidth = 100;
//   final double buttonHeight = 50;

//   @override
//   void initState() {
//     super.initState();
//     generateRandomButtons();
//   }

//   void generateRandomButtons() {
//     Random random = Random();
//     List<Offset> newButtonPositions = [];
//     List<Widget> newButtons = [];

//     while (newButtonPositions.length < labels.length) {
//       double randomX = (random.nextDouble() * 200)+50;
//       double randomY = (random.nextDouble() * 400) + 200;

//        Offset newPosition = Offset(randomX + 30, randomY + 20);
//       bool overlaps = false;
//       for (Offset position in newButtonPositions) {
//         if ((newPosition.dx < position.dx + buttonWidth &&
//              newPosition.dx + buttonWidth > position.dx &&
//              newPosition.dy < position.dy + buttonHeight &&
//              newPosition.dy + buttonHeight > position.dy)) {
//           overlaps = true;
//           break;
//         }
//       }

//       if (!overlaps) {
//         String labelText = labels[newButtonPositions.length];
//         newButtonPositions.add(newPosition);

//      newButtons.add(
//         Positioned(
//           left: randomX,
//           top: randomY,
//           child: TextButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(253, 172, 172, 1)),
//             onPressed: () {
//               String data = labelText ;
//               print(data);
//               Navigator.pushReplacementNamed(context,navigate_Qution, arguments: data,);},
//             child: Text(labelText),
//           ),
//         ),
//         );
//       }
//     }

//     setState(() {
//       buttonPositions = newButtonPositions;
//       buttons = newButtons;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Buttons with Lines'),
//       ),
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: Size(double.infinity, double.infinity),
//             painter: LinePainter(buttonPositions),
//           ),
//           Column(
//             children: [
//              Text("What do you want to learn")
            
//             ],
//           ),
//           ...buttons,
       
//         ],
//       ),
//     );
//   }
// }







// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:maincasenet/const/constdata.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../const/line_painter.dart';



// class ProgramLanguage extends StatefulWidget {
//   @override
//   _ProgramLanguageState createState() => _ProgramLanguageState();
// }

// class _ProgramLanguageState extends State<ProgramLanguage> {
//    List<Offset> buttonPositions = [];
//   List<Widget> buttons = [];
//   var data;
//   List<List<String>> imageUrls = [
//     ["lib/assests/image 1.png", "1"],
//     ["lib/assests/image 2.png","2"],
//     ["lib/assests/image 3.png","3"],
//     ["lib/assests/image 8.png","4"],
//     ["lib/assests/image 8.png","5"],
//     ["lib/assests/image 6.png","6"],
//     ["lib/assests/image 2.png","7"],
//     ["lib/assests/image 1.png","8"],
//   ];
// final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//  dynamic rawButtons ;
//     dynamic rawLinks;
//      List<String> buttons1 = [];
//      List<String> links=[];
//   final double buttonDiameter = 100;

//   @override
//   void initState() {
//     super.initState();

//      loadData();
//         final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     print("Arguments value: $value");

//      dynamic rawButtons = value?['Text'];
//     dynamic rawLinks = value?['Buttons'];

//     print("Raw buttons before casting: $rawButtons");
//     print("Raw links before casting: $rawLinks");

//      List<String> buttons1 = (rawButtons is String) 
//         ? [rawButtons] 
//         : (rawButtons is List ? rawButtons.cast<String>() : []);
//      List<String> links = (rawLinks is String) 
//         ? [rawLinks] 
//         : (rawLinks is List ? rawLinks.cast<String>() : []);

//     // print("Buttons after casting: $buttons1");
//     // print("Links after casting: $links");
//   }
//   Future<void> loadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     data = prefs.getString("value");
//     print("Loaded data1: $data");
//   }
//   @override
//   void didChangeDependencies() {
//     loadData();
//     super.didChangeDependencies();
    
//     generateRandomImages();
//   }

//   Future<void> generateRandomImages() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     data = prefs.getString("value");
//     print("Loaded data1: $data");
//     print("Links after casting: $links");
//     final size = MediaQuery.of(context).size; 
//     imageUrls.shuffle(Random());
//     List<Offset> newButtonPositions = [];
//     List<Widget> newButtons = [];
//     Random random = Random();

//     while (newButtonPositions.length < imageUrls.length) {
//       double randomX = ((random.nextDouble() * 200)+80 );
//       double randomY = (random.nextDouble() * (newButtonPositions.length * 60)+300);

//       Offset newPosition = Offset(randomX + 25, randomY+25);
//       bool overlaps = false;
//       for (Offset position in newButtonPositions) {
//         if ((newPosition.dx < position.dx + buttonDiameter &&
//             newPosition.dx + buttonDiameter > position.dx &&
//             newPosition.dy < position.dy + buttonDiameter &&
//             newPosition.dy + buttonDiameter > position.dy)) {
//           overlaps = true;
//           break;
//         }
//       }

//       if (!overlaps) {
//         String imageUrl = imageUrls[newButtonPositions.length][0];
//         print(".........$imageUrl");
//         String imageUrl1 = imageUrls[newButtonPositions.length][1];
//         print(imageUrl1);
//         newButtonPositions.add(newPosition);

//         newButtons.add(
//           Positioned(
//             left: randomX,
//             top: randomY,
//             child: GestureDetector(
//               onTap: ()  async {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 await prefs.setString("value", imageUrl);
//                data = prefs.getString("value");
//                print("Loaded data: $data");
                
//                 Navigator.pushReplacementNamed(context, navigate_Qution);
//               },
//               child: ClipOval(
//                 child: Container(
//                   color:  Color(0xFFD9D9D9),
//                   child: Stack(
//       children: [
//         Image.asset(
//           "lib/assests/Ellipse 9.png",
//           width: 72.88,
//           height: 72.88,
//         ),
//        Positioned(
//          left: 15,
//             top: 18,
//          child: Image.asset(
//               imageUrl,
//               width:42,
//               height:42,
//             ),
//        ),
//       ],
//     ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     setState(() {
//       buttonPositions = newButtonPositions;
//       buttons = newButtons;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color.fromARGB(255, 4, 4, 4),
//         child: Stack(
//           children: [
//             CustomPaint(
//               size: Size(double.infinity, double.infinity),
//               painter: LinePainter(buttonPositions),
//             ),
//             SizedBox(height: 120,),
//             Stack(
//                   children: <Widget>[
//                 Positioned(
//                   top: 40,
//                   child: IconButton(onPressed: () {
                    
//                     Navigator.pushReplacementNamed(context,navigate_MainQution);
//                   },  icon: Icon(Icons.arrow_back, color: Colors.blue,),)),
//                 Positioned(
//                   left: 110,
//                   top: 85,
//                   child: Stack(
//                     children: <Widget>[
//                       Image.asset("lib/assests/cloud1.png",
//                         width: 200,
//                         height: 200,
//                       ),
//                       const Positioned.fill(
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Online Course',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Color.fromARGB(255, 6, 6, 6),
//                                 ),
//                               ),
                            
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             ...buttons,
           
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:convert';
         
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import '../const/constdata.dart';
// import 'dart:math';
// import '../const/line_painter.dart';

// class ProgramLanguage extends StatefulWidget {
//   @override
//   _ProgramLanguageState createState() => _ProgramLanguageState();
// }

// class _ProgramLanguageState extends State<ProgramLanguage> {
//   List<Offset> buttonPositions = [];
//   List<Widget> buttons = [];
//   List<String> buttons1 = [];
//   List<String> links = [];
//   final double buttonDiameter = 100;
//   String? data;
//  Map<String, dynamic> value = {};

//   @override
//   void initState() {
//     super.initState();
//     print("objectlink1 Globals.imagedata.length${Globals.imagedata.length}");
//  if(Globals.imagedata.length >0){
//   links =  List.from(Globals.imagedata);
//   print("objectlink1 $links");
//   generateRandomImages();
//  }
//  else{
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//       if (value != null) {
//         dynamic rawButtons = value['Text'];
//         dynamic rawLinks = value['Buttons'];
//         buttons1 = (rawButtons is String) ? [rawButtons] : (rawButtons is List ? rawButtons.cast<String>() : []);
//         links = (rawLinks is String) ? [rawLinks] : (rawLinks is List ? rawLinks.cast<String>() : []);
//         print("Links after casting: $links");
//         Globals.imagedata  = List.from(links);
//         print("Globals.imagedata ${Globals.imagedata}");
//         generateRandomImages();
//       }
//     });}
// print("objectlink2 $links");
//   }



//   Future<void> generateRandomImages() async {
//   print("Linklinks1$links");
//     final size = MediaQuery.of(context).size;
//     List<Offset> newButtonPositions = [];
//     List<Widget> newButtons = [];
//     Random random = Random();
//       print("Linklinks2$links");
//     links.shuffle(Random());

//     while (newButtonPositions.length < links.length) {
//           double randomX = ((random.nextDouble() * 200)+80 );
//       double randomY = (random.nextDouble() * (newButtonPositions.length * 60)+300);

//          Offset newPosition = Offset(randomX + 25, randomY+25);
//       bool overlaps = false;
//       for (Offset position in newButtonPositions) {
//         if ((newPosition.dx < position.dx + buttonDiameter &&
//             newPosition.dx + buttonDiameter > position.dx &&
//             newPosition.dy < position.dy + buttonDiameter &&
//             newPosition.dy + buttonDiameter > position.dy)) {
//           overlaps = true;
//           break;
//         }
//       }
//       if (!overlaps) {
//         String imageUrl = links[newButtonPositions.length];
//         newButtonPositions.add(newPosition);
       
//         newButtons.add(
//           Positioned(
//             left: randomX,
//             top: randomY,
//             child: GestureDetector(
//               onTap: (){
//                fetchData(imageUrl);
//               },
//               child: ClipOval(
//                 child: Container(
//                   color: Color(0xFFD9D9D9),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         "lib/assests/Ellipse 9.png",
//                         width: 72.88,
//                         height: 72.88,
//                       ),
//                       Positioned(
//                         child: Image.asset(
//                         "lib/assests/$imageUrl.png",
//                         width: 72.88,
//                         height: 72.88,
//                       ),
                        
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     setState(() {
//       buttonPositions = newButtonPositions;
//       buttons = newButtons;
//     });
//     print("buttonsbuttonsbuttons$buttons");
//   }


  
//   Future<void> fetchData(String button) async {
//    var buttonbutton = button;
//    print("buttonbutton$buttonbutton");
//     // questions = Globals.dataList[Globals.currentIndex];
//     var data1 = Globals.dataQ;
//     print(data1);
//     final url = Uri.parse(
//         "https://fir-ea483-default-rtdb.firebaseio.com/casnet/$data1/$buttonbutton.json");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       value = json.decode(response.body) as Map<String, dynamic>;
//       var f = value["Text"];
//       var f1 = value["Type"];
//       print(".........$f1");
//       if (value["Type"] == "value") {
//         print("_currentIndex..${Globals.currentIndex}");
//         setState(() {
//         Globals.currentIndex = Globals.dataList.length - 2;});
//         print("......${Globals.currentIndex}");
//             print("......$value...........");
//         await Navigator.pushReplacementNamed(context,navigate_Summeryscreen, arguments: value);
//       }
//       if (value["Type"] == "link") {
//         print("------------------------------------------------------");
//         print("_currentIndex..${Globals.currentIndex}");
//         setState(() {
//         Globals.currentIndex = Globals.dataList.length - 2;});
//         print("......${Globals.currentIndex}");

//         await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
//       }
//       print(f);
//     } else {
//       throw Exception('Failed to load data');
//     }

   
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color.fromARGB(255, 4, 4, 4),
//         child: Stack(
//           children: [
//            SizedBox.expand(
//   child: CustomPaint(
//     size: Size(double.infinity, double.infinity),
//     painter: LinePainter(buttonPositions),
//   ),
// ),
//             SizedBox(height: 120),
//             Stack(
//               children: [
//                 Positioned(
//                   top: 40,
//                   child: IconButton(
//                     onPressed: () {
//                        Navigator.pushReplacementNamed(context, navigate_Qution); 
//                     },
//                     icon: Icon(Icons.arrow_back, color: Colors.blue),
//                   ),
//                 ),


//                 //
//               ],
//             ),
//             ...buttons,
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../const/constdata.dart';
import 'dart:math';
import '../const/line_painter.dart';

class ProgramLanguage extends StatefulWidget {
  @override
  _ProgramLanguageState createState() => _ProgramLanguageState();
}

class _ProgramLanguageState extends State<ProgramLanguage> {
  List<Offset> buttonPositions = [];
  List<Widget> buttons = [];
  List<String> buttons1 = [];
  List<String> links = [];
  final double buttonDiameter = 100;
  String? data;
  Map<String, dynamic> value = {};

  @override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((_) {
      final Map<String, dynamic>? value = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (value != null) {
        dynamic rawButtons = value['Text'];
        dynamic rawLinks = value['Buttons'];
print("rawButtons after casting: $rawButtons");
        buttons1 = (rawButtons is String) ? [rawButtons] : (rawButtons is List ? rawButtons.cast<String>() : []);
        links = (rawLinks is String) ? [rawLinks] : (rawLinks is List ? rawLinks.cast<String>() : []);
        print("Links after casting: $links");
        
        if(rawButtons == "data"){
          links = List.from(Globals.imagedata);
          print("linkslinks$links");
        }
        else{
Globals.imagedata  = List.from(links);
Globals.imagetext = rawButtons;
print("Globals.imagetext${Globals.imagetext}");
        }
        print("Globals.imagedata ${Globals.imagedata}");
        generateRandomImages();
        
        
      }
    });
  }

  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (Globals.imagedata.isNotEmpty) {
  //     links = List.from(Globals.imagedata);
  //     print("valuevaluevalue$name");
  //     if(name == "data"){
  //          generateRandomImages();
  //       }
  //   }
  // }

  Future<void> generateRandomImages() async {
    final size = MediaQuery.of(context).size;
    List<Offset> newButtonPositions = [];
    List<Widget> newButtons = [];
    Random random = Random();
    links.shuffle(Random());

    while (newButtonPositions.length < links.length) {
      double randomX = ((random.nextDouble() * 200) + 80);
      double randomY = (random.nextDouble() * (newButtonPositions.length * 60) + 300);

      Offset newPosition = Offset(randomX + 25, randomY + 25);
      bool overlaps = false;
      for (Offset position in newButtonPositions) {
        if ((newPosition.dx < position.dx + buttonDiameter &&
            newPosition.dx + buttonDiameter > position.dx &&
            newPosition.dy < position.dy + buttonDiameter &&
            newPosition.dy + buttonDiameter > position.dy)) {
          overlaps = true;
          break;
        }
      }
      if (!overlaps) {
        String imageUrl = links[newButtonPositions.length];
        newButtonPositions.add(newPosition);

        newButtons.add(
          Positioned(
            left: randomX,
            top: randomY,
            child: GestureDetector(
              onTap: () {
                fetchData(imageUrl);
              },
              child: ClipOval(
                child: Container(
                  color: Color(0xFFD9D9D9),
                  child: Stack(
                    children: [
                      Image.asset(
                        "lib/assests/Ellipse 9.png",
                        width: 72.88,
                        height: 72.88,
                      ),
                      Positioned(
                        child: Image.asset(
                          "lib/assests/$imageUrl.png",
                          width: 82.88,
                          height: 82.88,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    setState(() {
      buttonPositions = newButtonPositions;
      buttons = newButtons;
    });
  }

  Future<void> fetchData(String button) async {
 
    var buttonbutton = button;
    var data1 = Globals.dataQ;
    final url = Uri.parse(
        "https://fir-ea483-default-rtdb.firebaseio.com/casnet/$data1/$buttonbutton.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      value = json.decode(response.body) as Map<String, dynamic>;
      if (value["Type"] == "value") {
      
        await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
      }
      if (value["Type"] == "link") {
        
        await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 4, 4, 4),
        child: Stack(
          children: [
            SizedBox(height: 100,),
            Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0), // Adjust this value as needed
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "lib/assests/graphic.png",
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
                            '${Globals.imagetext}',
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
          ),
            SizedBox.expand(
              child: CustomPaint(
                size: Size(double.infinity, double.infinity),
                painter: LinePainter(buttonPositions),
              ),
            ),
            SizedBox(height: 120),
            Stack(
              children: [
                Positioned(
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, navigate_Qution);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
              ],
            ),
            ...buttons,
          ],
        ),
      ),
    );
  }
}


  