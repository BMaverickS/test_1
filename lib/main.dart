import 'package:flutter/material.dart';
import 'package:test_1/main_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var listData = MainViewModel();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            //Text("${listData.getData()}"),
            //Text("${listData.fetchDataList()}"),
            //Text("${listData.ed.length}"),
            buildList(context)
          ],
        )
      ),
    );
  }

  Widget buildList(BuildContext context) {//pass context, if not put into main build
    var listData = MainViewModel();
    listData.fetchDataList();
    return SizedBox(
      height: 100,
      child: Column (children: [
        //
      ],)
      /*child: ListView.builder(
        itemCount: listData.ed.length,
        itemBuilder: (BuildContext context, int index) { 
          return Column(
            children: [
              Text(listData.ed[index]),
              Text(listData.ed.length.toString())
            ],
          );
        }                   ,
      )*/
    );
  }
}
