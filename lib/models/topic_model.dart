import 'dart:convert';

import 'package:equatable/equatable.dart';

class TopicModel extends Equatable {
  final int id;
  final String name;
  TopicModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TopicModel.fromJson(String source) =>
      TopicModel.fromMap(json.decode(source));

  @override
  String toString() => 'TopicModel(id: $id, name: $name)';

  TopicModel copyWith({
    int? id,
    String? name,
  }) {
    return TopicModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id, name];
}
