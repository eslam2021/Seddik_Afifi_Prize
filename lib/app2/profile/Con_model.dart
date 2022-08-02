class ConModel {
  bool? status;
  String? message;
  ConDataModel? data;

  ConModel({
    this.status,
    this.message,
    this.data,
  });
  ConModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ConDataModel.fromJson(json['data']) : null;
  }
}

class ConDataModel {
  String? name;
  String? mobileNumber;
  String? email;
  int? age;
  String? nationalID;
  String? gender;
  String? token;
  String? specialization;
  String? result;

  ConDataModel({
    this.name,
    this.email,
    this.age,
    this.gender,
    this.token,
    this.result,
    this.nationalID,
    this.specialization,
    this.mobileNumber,
  });

  ConDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    specialization = json['specialization'];
    gender = json['gender'];
    age = json['Age'];
    result = json['result'];
    nationalID = json['nationalID'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'specialization': specialization,
      'gender': gender,
      'Age': age,
      'token': token,
      'nationalID': nationalID,
      'result': result,
      'mobileNumber': mobileNumber,
    };
  }
}
