import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final int role;
  final String name;
  final String phone;
  final String? email;
  final String? avatar;

  const AuthUser({
    required this.id,
    required this.phone,
    required this.role,
    this.name = '',
    this.email,
    this.avatar,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    role: json['role'],
    avatar: json['avatar'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'role': role,
    'avatar': avatar,
  };

  AuthUser copyWith({
    String? name,
    String? email,
    String? phone,
    int? role,
    String? avatar,
  }) => AuthUser(
    id: id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    role: role ?? this.role,
    avatar: avatar ?? this.avatar,
  );

  @override
  List<Object?> get props => [id, name, phone, email, role, avatar];

  @override
  String toString() =>
      'User{id: $id, name: $name, phone: $phone, email: $email, role: $role, avatar: $avatar}';
}
