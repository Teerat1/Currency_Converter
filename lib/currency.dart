//import 'dart:ffi';

import 'package:currency_converter/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'main.dart';

var rate;
Map<String, dynamic> info;
Map<String, dynamic> info2;
Map<String, dynamic> info3;
Map<String, dynamic> info4;
Map<String, dynamic> info5;
Map<String, dynamic> info6;
Map<String, dynamic> info7;
Map<String, dynamic> info8;
Map<String, dynamic> info9;
Map<String, dynamic> info10;

getData() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=USD";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info = (rate['rates']);

  return info;
}

convertion(String a, b, double x) {
  double c = info[a];
  double d = info[b];
  //print('value of b');
  //print(b);
  //print('value of c');
  //print(c);
  //print('value of d');
  //print(d);
  double f = c / d;
  return f * x;
}

getData2() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=EUR";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info2 = (rate['rates']);

  return info2;
}

getData3() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=MXN";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info3 = (rate['rates']);

  return info3;
}

getData4() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=AUD";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info4 = (rate['rates']);

  return info4;
}

getData5() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=HKD";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info5 = (rate['rates']);

  return info5;
}

getData6() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=BGN";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info6 = (rate['rates']);

  return info6;
}

getData7() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=SEK";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info7 = (rate['rates']);

  return info7;
}

getData8() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=NOK";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info8 = (rate['rates']);

  return info8;
}

getData9() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=INR";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info9 = (rate['rates']);

  return info9;
}

getData10() async {
  String myUrl = "https://api.exchangeratesapi.io/latest?base=BRL";
  var req = await http.get(myUrl);
  rate = json.decode(req.body);

  //print(rate);
  info10 = (rate['rates']);

  return info10;
}

infoselection(String typez) {
  if (typez == "USD") {
    TableState.cinfo = info;
    return info;
  }
  if (typez == "EUR") {
    TableState.cinfo = info2;
    return info2;
  }
  if (typez == "MXN") {
    TableState.cinfo = info3;
    return info3;
  }
  if (typez == "AUD") {
    TableState.cinfo = info4;
    return info4;
  }
  if (typez == "HKD") {
    TableState.cinfo = info5;
    return info5;
  }
  if (typez == "BGN") {
    TableState.cinfo = info6;
    return info6;
  }
  if (typez == "SEK") {
    TableState.cinfo = info7;
    return info7;
  }
  if (typez == "NOK") {
    TableState.cinfo = info8;
    return info8;
  }
  if (typez == "INR") {
    TableState.cinfo = info9;
    return info9;
  }
  if (typez == "BRL") {
    TableState.cinfo = info10;
    return info10;
  }
}
