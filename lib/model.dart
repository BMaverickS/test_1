class ElixirsList {
  List<ElixirsData>? eList;

  ElixirsList({this.eList});

  factory ElixirsList.fromJSON(List<dynamic> json) {
    return ElixirsList(eList: json.map((e) => 
      ElixirsData.fromJSON(e as Map<String, dynamic>)).toList());
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

  factory ElixirsData.fromJSON(Map<String, dynamic> json) {
    return ElixirsData(
      json["elixirs"],
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

  factory Elixirs.fromJSON(Map<String, dynamic> json) {
    return Elixirs(
      json["id"],
      json["name"]
    );
  }
}