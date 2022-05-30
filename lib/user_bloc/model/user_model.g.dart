part of 'user_model.dart';

User _$userFromJson(Map<String, dynamic> json) =>
  User(
    json['id'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['birthdate'] as String,
    json['phoneNumber'] as String,
  );

Map<String, dynamic> _$userToJson(User instance) =>
  <String, dynamic>{
    'id' : instance.id,
    'firstName': instance.firstName,
    'lastName': instance.lastName,
    'birthdate': instance.birthdate,
    'phoneNumber': instance.phoneNumber,
  };