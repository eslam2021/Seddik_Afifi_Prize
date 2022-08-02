class UserModel {
  bool? status;
  String? message;
  UserDataModel? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserDataModel.fromJson(json['data']) : null;
  }
}

class UserDataModel {
  String? name;
  String? mobileNumber;
  String? email;
  int? age;
  String? confPassword;
  String? nationalID;
  String? gender;
  String? password;
  String? token;

  UserDataModel({
    this.name,
    this.email,
    this.age,
    this.gender,
    this.token,
    this.password,
    this.nationalID,
    this.confPassword,
    this.mobileNumber,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    age = json['Age'];
    confPassword = json['confPassword'];
    nationalID = json['nationalID'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'Age': age,
      'token': token,
      'nationalID': nationalID,
      'confPassword': confPassword,
      'mobileNumber': mobileNumber,
    };
  }
}
