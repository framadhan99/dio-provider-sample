import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:dio_provider_sample/models/topic_model.dart';

class ResponseTopicModel extends Equatable {
  final bool status;
  final List<Topic> data;
  const ResponseTopicModel({
    required this.status,
    required this.data,
  });

  ResponseTopicModel copyWith({
    bool? status,
    List<Topic>? data,
  }) {
    return ResponseTopicModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ResponseTopicModel.fromMap(Map<String, dynamic> map) {
    return ResponseTopicModel(
      status: map['status'] ?? false,
      data: List<Topic>.from(map['data']?.map((x) => Topic.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseTopicModel.fromJson(String source) =>
      ResponseTopicModel.fromMap(json.decode(source));

  @override
  String toString() => 'ResponseTopicModel(status: $status, data: $data)';

  @override
  List<Object> get props => [status, data];
}
