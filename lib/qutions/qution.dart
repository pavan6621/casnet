
// import 'dart:convert';
         
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../const/constdata.dart';
           
// class Qution extends StatefulWidget {
//   @override
//   QutionState createState() => QutionState();
// }                          
                                          
// class QutionState extends State<Qution> {
//  String data = "data1";
//   String questions = "courses";
//   Map<String, dynamic> value = {};
//   bool isLoading = false;
// List<String> _dataList = [];
// int _currentIndex = -1;
//    @override
//  void initState() {
//    super.initState();
//    fetchData1();
//   //  Future.microtask(() {
//   //    final args = ModalRoute.of(context)?.settings.arguments as String?;
//   //    if (args != null) {
//   //      data = args;
//   //      if (data == "data") {
//   //        questions = "Volunteering";
//   //        _dataList.add(questions);
//   //     _currentIndex = _dataList.length - 1; 
//   //      } else if (data == "data1") {
//   //        questions = "courses";
//   //        _dataList.add(questions);
//   //     _currentIndex = _dataList.length - 1; 
//   //      } else {
//   //        questions = "Something";
//   //        _dataList.add(questions);
//   //     _currentIndex = _dataList.length - 1; 
//   //      }
        
//   //      fetchData();
//   //    }
//   //  });
//  }    
// Future<void> fetchData1() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var dataQ = prefs.getString('dataQ');
//    print("dataQ$dataQ");
//      if (dataQ != null) {
//        data = dataQ;
//        if (data == "data") {
//          questions = "Volunteering";
//          _dataList.add(questions);
//       _currentIndex = _dataList.length - 1; 
//        } else if (data == "data1") {
//          questions = "courses";
//          _dataList.add(questions);
//       _currentIndex = _dataList.length - 1; 
//        } else {
//          questions = "Something";
//          _dataList.add(questions);
//       _currentIndex = _dataList.length - 1; 
//        }
        
//        fetchData();
//      }
// }
//   Future<void> fetchData() async {
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
//       if (value["Type"] == "link") {
//         print("_currentIndex..$_currentIndex");
//         setState(() {
      
//         _currentIndex =  _dataList.length - 2; 
//         print("......$_currentIndex");
      
//     });
//         await Navigator.pushNamed(context, navigate_Summeryscreen, arguments: value);
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
//       _dataList.add(newQuestions);
//       _currentIndex = _dataList.length - 1;                                                                                                                            
//       questions = _dataList[_currentIndex];  
                                                                                                                                                          
//       fetchData();                                                                                                                                                      
//     });
//     print("newQuestions...$_currentIndex");                                                                                                                                                      
//   }                                                                                                                                                      
                                                                                                                                                      
//       void _removeData() {
//     setState(() {
//       if (_dataList.isNotEmpty) {
//         _dataList.removeLast();
//         _currentIndex = _dataList.isEmpty ? -1 : _dataList.length - 1; 
//         print(_currentIndex);
        
//       }
//       questions = _dataList[_currentIndex];
//        fetchData();
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
//                 color: Colors.black,
//                 child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 25),
//                         Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 onPressed: (){Navigator.pushReplacementNamed( context,navigate_MainQution,);} ,
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//               ),),
//                         SizedBox(height: 35),
//                         if(value["Type"] != "link")
//                           Align(     
//                             alignment: Alignment.center,           
//                             child: Text(          
//                               value['Text'] as String,
//                               style: GoogleFonts.workSans(
//               textStyle: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//                             ),
                            
//                           ),
//                         ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: (value['Buttons'] as List?)?.length ?? 0,
//                             itemBuilder: (context, index) {
//                               final button = (value['Buttons'] as List)[index];
//                               return ListTile(
//                                 title:    OutlinedButton(
//                                                     style: OutlinedButton.styleFrom(
//                                                       backgroundColor: Colors.black, 
//                                                       side: BorderSide(color: Colors.white), 
//                                                       shape: RoundedRectangleBorder(
//                                                         borderRadius: BorderRadius.circular(8.0), 
//                                                       ),
//                                                     ),
//                                                     onPressed: () {
//                                                       setState(() {
                                                                   
//                                        isLoading = true;
//                                         });updateQuestions(button);
//                                                     },
//                                                     child: Text(
//                                                       button,
//                                                       style:GoogleFonts.workSans( textStyle: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w200,
//               ),
//             ),
//                                                     ),
//                                                   ),
//                               );
//                             },
//                           ),
//                         if(_currentIndex >= 1)
//                         TextButton(onPressed: _removeData,
//                   child: Text('Previous'),),
//                       ],
//                     ),
//                   ),
//               ),
//     );
//   }
// }







import 'dart:convert';
         
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../const/constdata.dart';
        
class Qution extends StatefulWidget {
  @override
  QutionState createState() => QutionState();
}

class QutionState extends State<Qution> {
  String data = "data1";
  String questions = "courses";
  Map<String, dynamic> value = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData1();
  }

  Future<void> fetchData1() async {
  if(Globals.currentIndex >= 0){
    setState(() {
      Globals.removeLastData();
      questions = Globals.dataList.isNotEmpty ? Globals.dataList[Globals.currentIndex] : "";
      fetchData();
    });
      
  }
  else{
    print(Globals.dataList.length );
    print(Globals.dataList);
    if (Globals.dataQ != null) {
      data = Globals.dataQ;
      if (data == "data") {
        questions = "Volunteering";
      } else if (data == "data1") {
        questions = "courses";
      } else {
        questions = "Something";
      }

      Globals.addData(questions);
      fetchData();
    }}
  }

  Future<void> fetchData() async {
   
    // questions = Globals.dataList[Globals.currentIndex];
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        "https://fir-ea483-default-rtdb.firebaseio.com/casnet/$data/$questions.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      value = json.decode(response.body) as Map<String, dynamic>;
      var f = value["Text"];
      var f1 = value["Type"];
      print(".........$f1");
      // if (value["Type"] == "value") {
      //   print("_currentIndex..${Globals.currentIndex}");
      //   setState(() {
      //   Globals.currentIndex = Globals.dataList.length - 2;});
      //   print("......${Globals.currentIndex}");
      //       print("......$value...........");
      //   await Navigator.pushReplacementNamed(context,navigate_ProgramLanguage, arguments: value);
      // }
      if (value["Type"] == "link") {
        print("_currentIndex..${Globals.currentIndex}");
        setState(() {
        Globals.currentIndex = Globals.dataList.length - 2;});
        print("......${Globals.currentIndex}");

        await Navigator.pushReplacementNamed(context, navigate_Summeryscreen, arguments: value);
      }
      print(f);
    } else {
      throw Exception('Failed to load data');
    }

    setState(() {
      isLoading = false;
    });
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
                            onPressed: () { Navigator.pushReplacementNamed(context, navigate_MainQution);
                             setState(() {
        Globals.currentIndex = -1;});
        print("Globals.currentIndex${Globals.currentIndex}");},
                            icon: Icon(Icons.arrow_back, color: Colors.white),
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
                        ListView.builder(
                          shrinkWrap: true,
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
                                    textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (Globals.currentIndex >= 1)
                          TextButton(
                            onPressed: _removeData,
                            child: Text('Previous'),
                          ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
