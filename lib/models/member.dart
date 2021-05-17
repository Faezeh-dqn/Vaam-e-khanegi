import 'package:intl/intl.dart';

class Member {
  int id;
  String name;
  String lastName;
  String email;
  String password;
  String fatherName;
  String birthdate;
  String ssn;
  int telephone;
  int phoneNumber;
  String address;
  String accountNumber;
  String creditCard;
  int money;
  String createdAt;
  String updatedAt;
  int userId;
  String lastname;

  Member({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.password,
    this.fatherName,
    this.birthdate,
    this.ssn,
    this.telephone,
    this.phoneNumber,
    this.address,
    this.accountNumber,
    this.creditCard,
    this.money,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.lastname,
  });

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    fatherName = json['fatherName'];
    birthdate = json['birthdate'];
    ssn = json['ssn'];
    telephone = json['telephone'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    accountNumber = json['accountNumber'];
    creditCard = json['creditCard'];
    money = json['money'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? '123';
    data['name'] = this.name ?? '123';
    data['lastName'] = this.lastName ?? '123';
    data['email'] = this.email ?? '123';
    data['password'] = this.password ?? '123';
    data['fatherName'] = this.fatherName ?? '123';
    data['birthdate'] = this.birthdate ?? DateTime.now().toIso8601String();
    data['ssn'] = this.ssn ?? '123';
    data['telephone'] = this.telephone ?? '123';
    data['phoneNumber'] = this.phoneNumber ?? '123';
    data['address'] = this.address ?? '123';
    data['accountNumber'] = this.accountNumber ?? '123';
    data['creditCard'] = this.creditCard ?? '123';
    data['money'] = this.money ?? '123';
    data['created_at'] = this.createdAt ?? '123';
    data['updated_at'] = this.updatedAt ?? '123';
    data['user_id'] = this.userId ?? '123';
    data['lastname'] = this.lastname ?? '123';
    return data;
  }
}
