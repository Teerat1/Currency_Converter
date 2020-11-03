import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'currency.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/MOney.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: RaisedButton(
              child: Text(
                'Start',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                getData();
                print(info);
                _navigateToNextScreen(context);
              },
            ),
          )),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Mainmenu()));
  }
}

class Mainmenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Currency Converter',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Main Menu'),
            ),
            body: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Today Rate',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      onPressed: () {
                        _navigateTotodayrate(context);
                        TableState.cinfo = info;
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      child: Text(
                        'Converter',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      onPressed: () {
                        getData();
                        _navigateToconverter(context);
                      },
                    ),
                  ]),
            )));
  }

  void _navigateTotodayrate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Table()));
  }

  void _navigateToconverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Converter()));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class Converter extends StatefulWidget {
  Converter({Key key}) : super(key: key);
  @override
  ConverterState createState() => ConverterState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class ConverterState extends State<Converter> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  void initState() {
    super.initState();
  }

  final myController = TextEditingController();

  String input;
  static double output = 0.0;
  static double basedvalue;
  //int _value = 1;
  String dropdownValue = "USD";
  static String basedbox = 'EUR';
  String dropdownValue2 = "USD";
  static String targetbox = 'EUR';
  static double exrate;
  void _setText() {
    setState(() {
      input = myController.text;
    });
  }

  getDropDownItem() {
    setState(() {
      basedbox = dropdownValue;
    });
  }

  getDropDownItem2() {
    setState(() {
      targetbox = dropdownValue2;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget textbase() {
    return Text(
      'Base Value',
      style: TextStyle(fontSize: 18.0),
    );
  }

  Widget texttarget() {
    return Text(
      'Target Value',
      style: TextStyle(fontSize: 18.0),
    );
  }

  mySizebox() => SizedBox(
        width: 70.0,
        height: 5.0,
      );
  mySizebox1() => SizedBox(
        width: 0.0,
        height: 150.0,
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Converter'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                mySizebox1(),
                mySizebox(),
                textbase(),
                mySizebox(),
                texttarget()
              ],
            ),
            Row(
              children: <Widget>[
                mySizebox(),
                inputvalue(),
                mySizebox(),
                outputvalue(),
              ],
            ),
            Row(
              children: <Widget>[
                mySizebox1(),
                mySizebox(),
                dropbox1(),
                mySizebox(),
                dropbox2()
              ],
            ),
            Row(
              children: <Widget>[mySizebox(), convertionbutton()],
            ),
          ],
        ),
      ),
    );
  }

  Container convertionbutton() => Container(
        width: 250.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.orange[900],
            onPressed: () {
              getDropDownItem();
              getDropDownItem2();
              _setText();
              basedvalue = double.parse(input);
              output = convertion(basedbox, targetbox, basedvalue);
              //print();
            },
            child: Text(
              'Convert',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      );
  Widget inputvalue() => Container(
        width: 100.0,
        child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
              labelText: "Your input",
            )),
      );
  Widget outputvalue() => Container(
        width: 100.0,
        child: Text(
          output.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      );
  List<String> curtype = [
    'USD',
    'EUR',
    'MXN',
    'AUD',
    'HKD',
    'BGN',
    'SEK',
    'NOK',
    'INR',
    'BRL'
  ];
  Widget dropbox1() => Container(
        padding: EdgeInsets.all(20.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (data) {
            setState(() {
              dropdownValue = data;
            });
          },
          items: curtype.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );

  Widget dropbox2() => Container(
        padding: EdgeInsets.all(20.0),
        child: DropdownButton<String>(
          value: dropdownValue2,
          onChanged: (data) {
            setState(() {
              dropdownValue2 = data;
            });
          },
          items: curtype.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
}

class Table extends StatefulWidget {
  Table({Key key}) : super(key: key);
  @override
  TableState createState() => TableState();
}

class TableState extends State<Table> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  void initState() {
    super.initState();

    getData2();
    getData3();
    getData4();
    getData5();
    getData6();
    getData7();
    getData8();
    getData9();
    getData10();
  }

  //String dropdownValue = "USD";
  String basedtype = "USD";
  static Map<String, dynamic> cinfo = info;
  getDropDownItem() {
    setState(() {
      basedtype = basedtype;
    });
  }

  /// This is the stateless widget that the main application instantiates.
  List<String> curtype = [
    'USD',
    'EUR',
    'MXN',
    'AUD',
    'HKD',
    'BGN',
    'SEK',
    'NOK',
    'INR',
    'BRL'
  ];
  Widget dropbox1() => Container(
        padding: EdgeInsets.all(20.0),
        child: DropdownButton<String>(
          value: basedtype,
          onChanged: (data) {
            setState(() {
              basedtype = data;
              infoselection(data);
              print(data);
            });
          },
          items: curtype.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today Rate'),
        //backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[SizedBox(width: 150), dropbox1()],
          ),
          Row(
            children: <Widget>[
              type1(),
              SizedBox(
                width: 100,
              ),
              currate()
            ],
          )
        ],
      ),
    );
  }

  Widget type1() => Container(
        padding: EdgeInsets.only(left: 90.0),
        child: Column(
          children: [
            Text("USD"),
            SizedBox(height: 30),
            Text("EUR"),
            SizedBox(height: 30),
            Text("MXN"),
            SizedBox(height: 30),
            Text("AUD"),
            SizedBox(height: 30),
            Text("HKD"),
            SizedBox(height: 30),
            Text("BGN"),
            SizedBox(height: 30),
            Text("SEK"),
            SizedBox(height: 30),
            Text("NOK"),
            SizedBox(height: 30),
            Text("INR"),
            SizedBox(height: 30),
            Text("BRL"),
          ],
        ),
      );
  Widget currate() => Container(
        child: Column(
          children: [
            Text(cinfo["USD"].toString()),
            SizedBox(height: 30),
            Text(cinfo["EUR"].toString()),
            SizedBox(height: 30),
            Text(cinfo["MXN"].toString()),
            SizedBox(height: 30),
            Text(cinfo["AUD"].toString()),
            SizedBox(height: 30),
            Text(cinfo["HKD"].toString()),
            SizedBox(height: 30),
            Text(cinfo["BGN"].toString()),
            SizedBox(height: 30),
            Text(cinfo["SEK"].toString()),
            SizedBox(height: 30),
            Text(cinfo["NOK"].toString()),
            SizedBox(height: 30),
            Text(cinfo["INR"].toString()),
            SizedBox(height: 30),
            Text(cinfo["BRL"].toString()),
          ],
        ),
      );
//'USD','EUR','MXN','AUD','HKD','BGN','SEK','NOK','INR','BRL'
}
