import 'package:json_annotation/json_annotation.dart';

part 'login_model_out.g.dart';

@JsonSerializable()
class LoginModelOut {
  LoginModelOut({
    this.login,
    required this.senha,
    this.deviceId,
    this.deviceInfo,
  });

  String? login;
  String senha;
  String? deviceId;
  String? deviceInfo;

  factory LoginModelOut.fromJson(Map<String, dynamic> json) => _$LoginModelOutFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelOutToJson(this);
}
