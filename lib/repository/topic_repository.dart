import 'package:dio/dio.dart';
import 'package:dio_provider_sample/models/response_topic_model.dart';
import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:dio_provider_sample/services/constan.dart';

class TopicRepository {
  final Dio _dio = Dio();

  Future<ResponseTopicModel?> getAllResponseTopic() async {
    final response = await _dio.get(Routes.getCategoryTopic);
    try {
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return ResponseTopicModel.fromMap(data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Topic>?> getAllTopic() async {
    try {
      final result = await getAllResponseTopic();
      if (result != null) {
        final ResponseTopicModel response = result;
        return response.data;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteTopicbyId(int id) async {
    try {
      await _dio.post(Routes.deleteCategoryTopic, data: {
        'id': id,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createTopic(String name) async {
    try {
      await _dio.post(Routes.createCategoryTopic, data: {
        'name': name,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateTopic(int id, String name) async {
    try {
      await _dio.post(Routes.updateCategoryTopic, data: {
        'id': id,
        'name': name,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
