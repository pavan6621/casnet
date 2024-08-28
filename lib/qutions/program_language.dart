











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
      double randomX = ((random.nextDouble() * 100) + 80);
      double randomY = (random.nextDouble() * (newButtonPositions.length * 60) + 300);

      Offset newPosition = Offset(randomX + 25, randomY+ 25);
      bool overlaps = false;
      for (Offset position in newButtonPositions) {
        if ((newPosition.dx < position.dx + buttonDiameter &&
            newPosition.dx +  buttonDiameter > position.dx &&
            newPosition.dy <position.dy + buttonDiameter &&
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
                Globals.imagesave = imageUrl;
                Globals.summerdata = imageUrl;
                fetchData(imageUrl);
              },
              child: ClipOval(
                child: Container(
                  color: imageUrl==Globals.imagesave? Color.fromARGB(255, 173, 248, 168): Color.fromARGB(255, 245, 227, 227),
                  child: 
                     Image.asset(
                          "lib/assests/$imageUrl.png",
                          width: 72.88,
                          height: 72.88,
                          
                        )
                    
                  
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


  