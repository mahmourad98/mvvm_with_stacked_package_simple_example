import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User{
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthdate;

  User(this.id, this.firstName, this.lastName, this.phoneNumber, this.birthdate,);

  factory User.fromJson(Map<String, dynamic> json,){
    return _$userFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$userToJson(this);
  }

  @override
  String toString() {
    return "User(Id: ${this.id}, First Name: ${this.firstName}, Last Name: ${this.lastName}, Birthdate: ${this.birthdate}, PhoneNumber: ${this.phoneNumber},)";
  }
}