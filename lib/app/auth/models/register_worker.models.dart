// create class model for register worker
class RegisterWorkerModel {
  String? profilePicturePath;
  String? idPicturePath;
  String? name;
  String? address;
  String? gender;
  String? job;
  String? phone;
  String? password;
  String? accountType;

  RegisterWorkerModel({
    this.profilePicturePath,
    this.idPicturePath,
    this.name,
    this.address,
    this.gender,
    this.job,
    this.phone,
    this.password,
  });

  factory RegisterWorkerModel.fromJson(Map<String, dynamic> json) =>
      RegisterWorkerModel(
        profilePicturePath: json["profilePicturePath"],
        idPicturePath: json["idPicturePath"],
        name: json["name"],
        address: json["address"],
        gender: json['gender'],
        job: json['job'],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "profilePicturePath": profilePicturePath,
        "idPicturePath": idPicturePath,
        "name": name,
        "address": address,
        "job": job,
        "gender": gender,
        "phone": phone,
        "password": password,
      };
}
