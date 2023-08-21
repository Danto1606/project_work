// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

class BookModel {
  int id;
  int ownerId;
  int category;
  String isbn;
  String title;
  String author;
  String edition;
  String publisher;
  double price;
  int pages;
  Uint8List images;
  int? condition;

  BookModel({
    required this.id,
    required this.ownerId,
    required this.category,
    required this.isbn,
    required this.title,
    required this.author,
    required this.edition,
    required this.publisher,
    required this.price,
    required this.pages,
    required this.images,
    required this.condition,
  });

  BookModel copyWith({
    int? id,
    int? ownerId,
    int? category,
    String? isbn,
    String? title,
    String? author,
    String? edition,
    String? publisher,
    double? price,
    int? pages,
    Uint8List? images,
    int? condition,
  }) {
    return BookModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      category: category ?? this.category,
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      author: author ?? this.author,
      edition: edition ?? this.edition,
      publisher: publisher ?? this.publisher,
      price: price ?? this.price,
      pages: pages ?? this.pages,
      images: images ?? this.images,
      condition: condition ?? this.condition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ownerId': ownerId,
      'category': category,
      'isbn': isbn,
      'title': title,
      'author': author,
      'edition': edition,
      'publisher': publisher,
      'price': price,
      'pages': pages,
      'images': images,
      'condition': condition,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as int,
      ownerId: map['ownerId'] as int,
      category: map['category'] as int,
      isbn: map['isbn'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      edition: map['edition'] as String,
      publisher: map['publisher'] as String,
      price: map['price'] as double,
      pages: map['pages'] as int,
      images: Uint8List.fromList(map['images']),
      condition: map['condition'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(id: $id, ownerId: $ownerId, category: $category, isbn: $isbn, title: $title, author: $author, edition: $edition, publisher: $publisher, price: $price, pages: $pages, images: $images, condition: $condition)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.ownerId == ownerId &&
      other.category == category &&
      other.isbn == isbn &&
      other.title == title &&
      other.author == author &&
      other.edition == edition &&
      other.publisher == publisher &&
      other.price == price &&
      other.pages == pages &&
      listEquals(other.images, images) &&
      other.condition == condition;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      ownerId.hashCode ^
      category.hashCode ^
      isbn.hashCode ^
      title.hashCode ^
      author.hashCode ^
      edition.hashCode ^
      publisher.hashCode ^
      price.hashCode ^
      pages.hashCode ^
      images.hashCode ^
      condition.hashCode;
  }
}

