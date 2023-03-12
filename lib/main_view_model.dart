import 'package:flutter/material.dart';
import 'package:test_1/model.dart';
import 'data_source.dart';

class MainViewModel extends ChangeNotifier {
  // ChangeNotifier : notify view when 1 or more variables change in its ViewModel. It prevents to use
  // setState() function directly in our views which would results in unmaintainable code
  // put 'notifyListener()' inside function to update view
  // read more here : https://jgrandchavin.medium.com/flutter-provider-changenotifier-architecture-guide-47ad05aa608e

  Future<ElixirsList> getData() async { // dio
    return DataSource().getDataSource();
  }

  Future fetchDataList() async { // http
    return DataSource().fetchDataListSource();
  }
}

// final : immutable (value is not known in compile time)
// var : mutable
// const : value is known at compile time

// get data from List<dynamic> without data model
// https://medium.com/@bobbykboseoffice/json-parsing-using-dio-in-flutter-9c870d3d1759

// get data using data model example tutorial
// https://dhruvnakum.xyz/flutter-bloc-v8-how-to-fetch-data-from-an-api-2022-guide