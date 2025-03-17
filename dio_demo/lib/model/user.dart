class UserModel {
  final int id;
  final String name;

  UserModel({required this.id, required this.name});

  // 从 JSON 解析
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json["id"], name: json["name"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }

  @override
  String toString() {
    return "id : $id \n name : $name";
  }
}
