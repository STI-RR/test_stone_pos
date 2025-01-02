// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelOut _$LoginModelOutFromJson(Map<String, dynamic> json) =>
    LoginModelOut(
      login: json['login'] as String?,
      senha: json['senha'] as String,
      deviceId: json['deviceId'] as String?,
      deviceInfo: json['deviceInfo'] as String?,
    );

Map<String, dynamic> _$LoginModelOutToJson(LoginModelOut instance) =>
    <String, dynamic>{
      'login': instance.login,
      'senha': instance.senha,
      'deviceId': instance.deviceId,
      'deviceInfo': instance.deviceInfo,
    };
