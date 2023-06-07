import 'dart:convert';

import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final int id;
  final String name;
  final String createdAt;
  final String updateAt;
  const Topic({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updateAt,
  });

  Topic copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updateAt,
  }) {
    return Topic(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      createdAt: map['created_at'] ?? '',
      updateAt: map['update_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Topic(id: $id, name: $name, created_at: $createdAt, update_at: $updateAt)';
  }

  @override
  List<Object> get props => [id, name, createdAt, updateAt];
}
