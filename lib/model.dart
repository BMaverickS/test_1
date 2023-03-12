class ElixirsList {
  List<ElixirsData>? eList;

  ElixirsList({this.eList});

  factory ElixirsList.fromJson(List<dynamic> jsonList) {
    return ElixirsList(
      eList: jsonList.map((e) => ElixirsData.fromJson(e)).toList()
    );
    // can also be made like this :
    //List<ElixirsData> eList = jsonList.map((e) => ElixirsData.fromJson(e)).toList();
    //return ElixirsList(eList: eList);
  }
}

class ElixirsData {
  List<Elixirs>? elixirs;
  String? id;
  String? firstName;
  String? lastName;

  ElixirsData(
    this.elixirs,
    this.id,
    this.firstName,
    this.lastName
  );

  factory ElixirsData.fromJson(Map<String, dynamic> json) {
    var list = json["elixirs"] as List;

    return ElixirsData(
      list.map((e) => Elixirs.fromJson(e)).toList(),
      json["id"],
      json["firstName"],
      json["lastName"]
    );
  }
}

class Elixirs {
  String? id;
  String? name;

  Elixirs(
    this.id,
    this.name
  );

  factory Elixirs.fromJson(Map<String, dynamic> json) {
    return Elixirs(
      json["id"],
      json["name"]
    );
  }
}

// Parsing complex json : https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51