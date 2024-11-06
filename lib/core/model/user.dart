class UserModel {
  String name;
  String email;
  String id;

  UserModel({required this.email, required this.name, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "id": id,
    };
  }
}
