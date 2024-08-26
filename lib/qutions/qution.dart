import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../const/constdata.dart'; // Assuming this contains necessary constants

class Qution extends StatefulWidget {
  @override
  QutionState createState() => QutionState();
}

class QutionState extends State<Qution> {
  var data;
  var questions;
  Map<String, dynamic> value = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData1();
  }

  Future<void> fetchData1() async {
    if (Globals.currentIndex >= 0) {
      setState(() {
        Globals.removeLastData();
         data = Globals.dataQ;
        questions = Globals.dataList.isNotEmpty ? Globals.dataList[Globals.currentIndex] : "";
        print("${Globals.dataQ},.,,,$questions");
        fetchData();
        
      });
    } else {
      print("datadatadatadatadata${Globals.dataQ}");
      setState(() {
        data = Globals.dataQ;
      });
      print("datadatadatadatadata$data");
      if (data == "data") {
        questions = "Volunteering";
      } else if (data == "data1") {
        questions = "courses";
      } else {
        questions = "Something";
      }

      Globals.addData(questions);
      fetchData();
    }
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse(
          "https://fir-ea483-default-rtdb.firebaseio.com/casnet/$data/$questions.json");
      final response = await http.get(url);
       print("${data},.,,,$questions");
          print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        setState(() {
          value = json.decode(response.body) as Map<String, dynamic>;
        });
        print("valuevalue$value");
        var f = value["Text"];
        var f1 = value["Type"];
        print(".........$f1");
         if (value["Type"] == "value") {
        print("_currentIndex..${Globals.currentIndex}");
       
            Globals.imagedata.clear();
            Globals.imagetext = "";
            Globals.imagetype = "value";
        await Navigator.pushReplacementNamed(context,navigate_ProgramLanguage, arguments: value);
      }
        if (value["Type"] == "link") {
           Globals.imagedata.clear();
           Globals.imagetext = "";
           Globals.imagetype = "";
          await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
        }
        print(f);
      } else {
        showError('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      showError('Failed to load data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void updateQuestions(String newQuestions) {
    setState(() {
      Globals.addData(newQuestions);
      questions = Globals.dataList[Globals.currentIndex];
      fetchData();
    });
    print("newQuestions...${Globals.currentIndex}");
  }

  void _removeData() {
    setState(() {
      Globals.removeLastData();
      questions = Globals.dataList.isNotEmpty ? Globals.dataList[Globals.currentIndex] : "";
      fetchData();
    });
    print("newQuestions...$questions");
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Container(color: Colors.black, child: Center(child: CircularProgressIndicator()))
          : value.isEmpty
              ? Center(child: Text('No data available'))
              : Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, navigate_MainQution);
                              setState(() {
                                Globals.currentIndex = -1;
                              });
                              print("Globals.currentIndex${Globals.currentIndex}");
                            },
                            icon: Icon(Icons.home, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 35),
                        if (value["Type"] != "link")
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              value['Text'] as String,
                              style: GoogleFonts.workSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: (value['Buttons'] as List?)?.length ?? 0,
                            itemBuilder: (context, index) {
                              final button = (value['Buttons'] as List)[index];
                              return ListTile(
                                title: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    updateQuestions(button);
                                  },
                                  child: Text(
                                    button,
                                    style: GoogleFonts.workSans(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (Globals.currentIndex >= 1)
                          ElevatedButton(
                            onPressed: _removeData,
                             style: OutlinedButton.styleFrom(
    backgroundColor: Colors.black, 
    side: BorderSide(color: const Color.fromARGB(255, 95, 99, 156), width: 2.0), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
          
                            child: Container(
                             width: 100,
                              child: Row(
                                children: [
                                 Icon( Icons.arrow_left, ),
                                  Text(
                                    'Previous',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
    );
  }
}






// import 'dart:convert';
         
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import '../const/constdata.dart';
        
// class Qution extends StatefulWidget {
//   @override
//   QutionState createState() => QutionState();
// }

// class QutionState extends State<Qution> {
//   String data = "data1";
//   String questions = "courses";
//   Map<String, dynamic> value = {};
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchData1();
//   }

//   Future<void> fetchData1() async {
//   if(Globals.currentIndex >= 0){
//     setState(() {
//       Globals.removeLastData();
//       questions = Globals.dataList.isNotEmpty ? Globals.dataList[Globals.currentIndex] : "";
//       fetchData();
//     });
      
//   }
//   else{
//    print("datadatadatadatadata${Globals.dataQ}");
//       setState(() {
//       data = Globals.dataQ;
//       });
//       print("datadatadatadatadata$data");
//       if (data == "data") {
//         questions = "Volunteering";
//       } else if (data == "data1") {
//         questions = "courses";
//       } else {
//         questions = "Something";
//       }

//       Globals.addData(questions);
//       fetchData();
//     }
//   }

//   Future<void> fetchData() async {
   
//     // questions = Globals.dataList[Globals.currentIndex];
//     setState(() {
//       isLoading = true;
//     });

//     final url = Uri.parse(
//         "https://fir-ea483-default-rtdb.firebaseio.com/casnet/$data/$questions.json");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       value = json.decode(response.body) as Map<String, dynamic>;
//       var f = value["Text"];
//       var f1 = value["Type"];
//       print(".........$f1");
//       if (value["Type"] == "value") {
//         print("_currentIndex..${Globals.currentIndex}");
       
//             Globals.imagedata.clear();
//         await Navigator.pushReplacementNamed(context,navigate_ProgramLanguage, arguments: value);
//       }
//       if (value["Type"] == "link") {


//         await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
//       }
//       print(f);
//     } else {
//       throw Exception('Failed to load data');
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   void updateQuestions(String newQuestions) {
//     setState(() {
//       Globals.addData(newQuestions);
//       questions = Globals.dataList[Globals.currentIndex];
//       fetchData();
//     });
//     print("newQuestions...${Globals.currentIndex}");
//   }

//   void _removeData() {
//     setState(() {
//       Globals.removeLastData();
//       questions = Globals.dataList.isNotEmpty ? Globals.dataList[Globals.currentIndex] : "";
//       fetchData();
//     });
//     print("newQuestions...$questions");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? Container(color: Colors.black, child: Center(child: CircularProgressIndicator()))
//           : value.isEmpty
//               ? Center(child: Text('No data available'))
//               : Container(
//                   color: Colors.black,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 25),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: IconButton(
//                             onPressed: () { Navigator.pushReplacementNamed(context, navigate_MainQution);
//                              setState(() {
//         Globals.currentIndex = -1;});
//         print("Globals.currentIndex${Globals.currentIndex}");},
//                             icon: Icon(Icons.arrow_back, color: Colors.white),
//                           ),
//                         ),
//                         SizedBox(height: 35),
//                         if (value["Type"] != "link")
//                           Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               value['Text'] as String,
//                               style: GoogleFonts.workSans(
//                                 textStyle: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: (value['Buttons'] as List?)?.length ?? 0,
//                           itemBuilder: (context, index) {
//                             final button = (value['Buttons'] as List)[index];
//                             return ListTile(
//                               title: OutlinedButton(
//                                 style: OutlinedButton.styleFrom(
//                                   backgroundColor: Colors.black,
//                                   side: BorderSide(color: Colors.white),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     isLoading = true;
//                                   });
//                                   updateQuestions(button);
//                                 },
//                                 child: Text(
//                                   button,
//                                   style: GoogleFonts.workSans(
//                                     textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         if (Globals.currentIndex >= 1)
//                           TextButton(
//                             onPressed: _removeData,
//                             child: Text('Previous'),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//     );
//   }
// }
