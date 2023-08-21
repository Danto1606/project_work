// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  int id;
  int seller;
  String title;
  String author;
  double price;
  String publisher;
  String isbn;
  int category;
  int pages;
  int condition;
  Uint8List coverImage;
  String? description;
  List<Uint8List>? images;

  ProductModel({
    required this.id,
    required this.seller,
    required this.title,
    required this.author,
    required this.price,
    required this.publisher,
    required this.isbn,
    required this.category,
    required this.pages,
    required this.condition,
    required this.coverImage,
    this.description,
    this.images,
  });

  ProductModel copyWith({
    int? id,
    int? seller,
    String? title,
    String? author,
    double? price,
    String? publisher,
    String? isbn,
    int? category,
    int? pages,
    int? condition,
    Uint8List? coverImage,
    String? description,
    List<Uint8List>? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      seller: seller ?? this.seller,
      title: title ?? this.title,
      author: author ?? this.author,
      price: price ?? this.price,
      publisher: publisher ?? this.publisher,
      isbn: isbn ?? this.isbn,
      category: category ?? this.category,
      pages: pages ?? this.pages,
      condition: condition ?? this.condition,
      coverImage: coverImage ?? this.coverImage,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'seller': seller,
      'title': title,
      'author': author,
      'price': price,
      'publisher': publisher,
      'isbn': isbn,
      'category': category,
      'pages': pages,
      'condition': condition,
      'coverImage': coverImage,
      'description': description,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      seller: map['seller'] as int,
      title: map['title'] as String,
      author: map['author'] as String,
      price: map['price'] as double,
      publisher: map['publisher'] as String,
      isbn: map['isbn'] as String,
      category: map['category'] as int,
      pages: map['pages'] as int,
      condition: map['condition'] as int,
      coverImage: map['coverImage'] as Uint8List,
      description: map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null ?map['images'] as List<Uint8List> : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, seller: $seller, title: $title, author: $author, price: $price, publisher: $publisher, isbn: $isbn, category: $category, pages: $pages, condition: $condition, coverImage: $coverImage, description: $description, images: $images)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.seller == seller &&
      other.title == title &&
      other.author == author &&
      other.price == price &&
      other.publisher == publisher &&
      other.isbn == isbn &&
      other.category == category &&
      other.pages == pages &&
      other.condition == condition &&
      other.coverImage == coverImage &&
      other.description == description &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      seller.hashCode ^
      title.hashCode ^
      author.hashCode ^
      price.hashCode ^
      publisher.hashCode ^
      isbn.hashCode ^
      category.hashCode ^
      pages.hashCode ^
      condition.hashCode ^
      coverImage.hashCode ^
      description.hashCode ^
      images.hashCode;
  }
}
