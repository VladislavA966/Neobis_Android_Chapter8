class UserInfoModel {
  String? name;
  String? surname;
  String? lastname;
  String? birthDate;

  UserInfoModel({this.name, this.surname, this.lastname, this.birthDate});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    lastname = json['lastname'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['lastname'] = lastname;
    data['birthDate'] = birthDate;
    return data;
  }
}
