// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class UserModel {
  int id;
  String name;
  String email;
  String? password;
  String? address;
  double? lat;
  double? long;
  Uint8List? image;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    this.address,
    this.lat,
    this.long,
    this.image,
  });

  

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? address,
    double? lat,
    double? long,
    Uint8List? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'lat': lat,
      'long': long,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      long: map['long'] != null ? map['long'] as double : null,
      image: map['image'] != null ? map['image'] as Uint8List: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, address: $address, lat: $lat, long: $long, image: $image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.address == address &&
      other.lat == lat &&
      other.long == long &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      address.hashCode ^
      lat.hashCode ^
      long.hashCode ^
      image.hashCode;
  }
}
