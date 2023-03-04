import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_1/model.dart';
import 'package:http/http.dart' as http;

class MainViewModel extends ChangeNotifier { // ChangeNotifier : 
  Dio dio = Dio();

  final url = "https://wizard-world-api.herokuapp.com/wizards";
  List<dynamic> ed = [];

  Future<void> getData() async {
    Response dt = await dio.get(url);
    try {
      debugPrint('data : $dt');
    }
    catch (e) {
      debugPrint('No Data');
    }
    notifyListeners();
  }

  Future<dynamic> fetchDataList() async {//ElixirsData
    final res = await http.get(Uri.parse(url));

    //return res.body;
    final jsonDecoder = json.decode(res.body);
    ed = List.from(jsonDecoder);
    notifyListeners();
    //debugPrint(ed.length.toString());
    debugPrint("http  :   $ed");
    //debugPrint(parsedata(res.body) as String?);
    //parsedata(res.body);
  }

  // change response data type into ElixirsData
  /*ElixirsList parsedata(final resp)
  {
    // from string to json object
    final jsonDecoder = json.decode(resp);
    //debugPrint(resp);
    //final dt = JsonDecoder;
    //debugPrint(jsonDecoder);

    return ElixirsList.fromJSON(jsonDecoder);
  }*/

  // final : immutable (value is not known in compile time)
  // var : mutable
  // const : value is known at compile time
}