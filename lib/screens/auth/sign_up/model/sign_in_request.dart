import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInRequest {
  String? email;
  String? password;
  SignInRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': email,
      'password': password,
    };
  }

  factory SignInRequest.fromMap(Map<String, dynamic> map) {
    return SignInRequest(
      email: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}
