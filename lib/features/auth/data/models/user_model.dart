class UserModel {
  String email;
  String firstName = "";
  String lastName = "";
  final String uid;
  String photoUrl = "";
  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.uid,
    this.photoUrl = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "photoUrl": photoUrl,
      "uid": uid
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        photoUrl: json["photoUrl"] ?? "",
        uid: json["uid"]);
  }
}
