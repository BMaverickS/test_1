import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_1/model.dart';
import 'package:http/http.dart' as http;

class DataSource { // get API data from here, access from view model
  Dio dio = Dio();

  final url = "https://wizard-world-api.herokuapp.com/wizards";
  List<dynamic> ed = [];

  Future<ElixirsList> getDataSource() async { // dio
    final dt = await dio.get(url);
    if (dt.statusCode == 200)
    {
      final eListData = ElixirsList.fromJson(dt.data);
      //debugPrint('data : $dt');
      //debugPrint(ElixirsList.fromJson(dt.data).eList.toString());
      //debugPrint(s.toString());
      //debugPrint(ed.add(s));
      return eListData;
    }
    else
    {
      return ElixirsList(eList: []);
    }
  }

  Future fetchDataListSource() async { // http
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200)
    {
      ed = json.decode(res.body);
      return ed;
    }
    else
    {
      return ed;
    }
  }
}