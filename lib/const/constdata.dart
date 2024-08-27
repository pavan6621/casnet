

const String navigate_LoginScreen ="/";
const String navigate_HomeScreen ="/HomeScreen";
const String navigate_HomePageContent ="/HomePageContent";
const String navigate_MainQution ="/MainQution";
const String navigate_ProgramLanguage ="/ProgramLanguage";
const String navigate_Qution ="/Qution";
const String navigate_Summeryscreen ="/Summeryscreen";
const String navigate_Linkscreen ="/Linkscreen";
const String cloud1 ="lib/assests/graphic.png";
const String maincloud ="lib/assests/Isolation_Mode (1).png";


class Globals {
  static List<String> _dataList = [];
  static List<String> imagedata = [];
  static String imagetext = "data1";
  static String imagetype = "value";
  static String imagesave = "value";
  static dynamic summerdata = "value";
  static Map<String, dynamic> Summerydata = {};
  static int _currentIndex = -1;
  static var dataQ = "data1";
  static var questions = "courses";
  
  static List<String> get dataList => _dataList;
  static int get currentIndex => _currentIndex;
  static set currentIndex(int index) {
    _currentIndex = index;
  }
  
  static void addData(String data) {
    _dataList.add(data);
    _currentIndex = _dataList.length - 1;
  }
  static void remo() {
    _dataList.clear();
    print("_dataList_dataList  $_dataList");
    _currentIndex = - 1;
  }

  static void removeLastData() {
    if (_dataList.isNotEmpty) {
      _dataList.removeLast();
      _currentIndex = _dataList.isEmpty ? -1 : _dataList.length - 1;
    }
  }
}
