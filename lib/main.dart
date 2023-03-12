import 'package:flutter/material.dart';
import 'package:test_1/bloc_view.dart';
//import 'package:test_1/main_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/model.dart';

void main() {
  runApp(const MainApp());
}

// without bloc state management
/*class MainApp extends StatelessWidget { // stateless will run stateful
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => 
        ),
      ),
    );
    //var listData = MainViewModel();

    /*return BuildApp(
      init: () async {
        itemList = await vm() as List;
        print(itemList);//send itemlist data to buildlist widget
      }, 
      child: MaterialApp(
        home: BuildA
      ),
    );*/
    return const MaterialApp(
      home: BuildApp(),
    );
  }

  /*Future vm() {
    //run view model in initState (stateful widget only) so it will run only once
    var listData = MainViewModel();
    
    //print("vm : ${await listData.fetchDataList()}");
    return listData.fetchDataList();
  }*/

  /*Widget buildList(BuildContext context) {//pass context, if not put into main build
    
    return SizedBox(
      height: 100,
      child: Column (children: [
        Text(""),
      ],),
      /*child: ListView.builder(
        itemCount: listData.ed.isNotEmpty ? listData.ed.length : 0,
        itemBuilder: (BuildContext context, int index) { 
          //var itemList = listData.fetchDataList();
          //debugPrint("print       :         $itemList");
          debugPrint("length    :   " + listData.ed.length.toString());
          return Column(
            children: [
              //Text(listData.ed[index]),
              //Text(listData.ed.length.toString())
              //Text("$itemList"),
            ],
          );
        }                   ,
      )*/
    );
  }*/
}*/

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //var itemList = [];
  //var itemCount = 0;
  //final listData = MainViewModel();
  final BlocHandler blocHandler = BlocHandler();

  @override
  void initState() {
    // statefulWidget for initState() function
    // get data from API here using initState()

    //run view model in initState (stateful widget only) so it will run only once
    //vm();
    //debugPrint("itemList : ${itemList.toString()}");
    blocHandler.add(FetchData());

    super.initState();
  }

  /*vm() async {
    //run view model in initState (stateful widget only) so it will run only once
    
    itemCount = await listData.fetchDataList();
    debugPrint("itemCount : $itemCount");
    return itemCount;
    //debugPrint(itemList.toString());
    //itemCount = await listData.getData();//cont try to show data without reload
  }*/

  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //body: buildList(context)
        body: Column(
          children: [
            //Text("$itemCount"),
            //Text("${listData.fetchDataList()}"),
            //Text("${listData.ed.length}"),
            buildList(context)
          ],
        )
      ),
    );
  }*/

  /*Widget buildList(BuildContext context) {//pass context, if not put into main build
    return Expanded(
      //height: 100,
      /*child: Column (children: [
        Text("$itemList"),
      ],),*/
      child: ListView.builder(
        itemCount: itemList.isNotEmpty ? itemList.length : 0,
        itemBuilder: (BuildContext context, int index) { 
          //var itemList = listData.fetchDataList();
          //debugPrint("print       :         $itemList");
          //debugPrint("length    :   " + listData.ed.length.toString());
          return Column(
            children: [
              //Text("$itemCount"),
              Text("${itemList[index]}"),
              //Text(listData.ed[index]),
              //Text(listData.ed.length.toString())
              //Text("$itemList"),
            ],
          );
        },
      )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // without bloc
        //body: buildList(context)
        /*body: Column(
          children: [
            //Text("$itemCount"),
            //Text("${listData.fetchDataList()}"),
            //Text("${listData.ed.length}"),
            buildList(context)
          ],
        )*/
        body: BlocProvider(
          create: (context) => blocHandler,
          child: buildView(),
        )
      ),
    );
  }

  Widget buildView() {
    return BlocBuilder<BlocHandler, StateHandler>(
      builder: (context, state) {
        if (state is Loading)
        {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is Loaded)
        {
          return Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: Text( // dio
                  "Dio Item Count : ${state.elixirsList.eList?.length}",
                  textAlign: TextAlign.start,
                ),
                /*child: Text( // http
                  "Http Item Count : ${state.elixirsList.length}",
                  textAlign: TextAlign.start,
                ),*/
              ),
              buildList(state.elixirsList.eList) // dio
              //buildList(state.elixirsList) // http
            ],
          );
        }
        else if (state is Error)
        {
          return Center (
            child: Text(
              state.msg!,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
          );
        }
        else
        {
          return Container();
        }
      }
    );
  }
  /*
  BlocBuilder : used to draw a widget based on what is the current state
  BlocListener : a listener not a builder, its job is to keep listening for new changes in the 
                 state and not to return a widget. Each time the state changes to a new state this
                 listener will receive a notification that the state has changed and then you can 
                 trigger an action. So what gets draw in the screen doesn't depends of what we 
                 receive in the listener
  BlocConsumer : the mix between BlocBuilder and BlocListener. This is used when we want to draw 
                 something based on the current state and execute some actions depending on the 
                 new arriving states
  * avoid the usage of Bloc Builder, Listener, and Consumer if we are not going to draw or execute
    and action based on a state

  Source : https://ppantaleon.medium.com/flutter-blocbuilder-vs-blocconsumer-vs-bloclistener-a4a3ce7bfa9a
  */

  // Using data model and dio
  Widget buildList(List<ElixirsData>? eData) {
    return Expanded(
      child: ListView.builder(
        itemCount: eData!.isNotEmpty ? eData.length : 0,
        itemBuilder: (BuildContext context, int index) { 
          return Card(
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(5), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Elixirs :"),
                  for (var i in eData[index].elixirs!) Text("   Id : ${i.id}\n   Name : ${i.name}"),
                  Text("Id : ${eData[index].id}"),
                  Text("First name : ${eData[index].firstName}"),
                  Text("Last name : ${eData[index].lastName}"),
                ],
              )
            )
          );
        }                   ,
      )
    );
  }

  // Using loop on List<dynamic> type and http
  /*Widget buildList(List<dynamic> eData) {
    return Expanded(
      child: ListView.builder(
        itemCount: eData.isNotEmpty ? eData.length : 0,
        itemBuilder: (BuildContext context, int index) { 
          return Card(
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(5), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Elixirs :"),
                  for (var i in eData[index]["elixirs"]) 
                    Text("   Id : ${i["id"]}\n   Name : ${i["name"]}"),
                  Text("Id : ${eData[index]["id"]}"),
                  Text("First name : ${eData[index]["firstName"]}"),
                  Text("Last name : ${eData[index]["lastName"]}"),
                ],
              )
            )
          );
        },
      )
    );
  }*/
}

/*
Note switch between dio (access data using data model) and http (access data using loop) :
- main.dart
change buildView 'loaded' state : comment dio section for http or vice versa (container, buildList)
change buildList : comment buildList dio for http or vice versa

- bloc_view.dart
change loaded constructor : comment dio or http (ElixirsList or List<dynamic>)
change BlocHandler : comment 'emit(Loaded(httpList))' for dio or vice versa

Note : use data model for better approach or loop for easier approach
*/