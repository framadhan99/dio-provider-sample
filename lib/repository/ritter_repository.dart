import 'package:dio/dio.dart';
import 'package:dio_provider_sample/models/custom_error.dart';
import 'package:dio_provider_sample/models/response_topic_model.dart';
import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:dio_provider_sample/services/dio_error_handler.dart';

class RitterRepository {
  final Dio _dio = Dio();
  // final int id;

  Future<ResponseTopicModel?> getAllUser() async {
    const String baseUrl =
        "https://htapp.rittercoding.com/api/getCategoryTopic/";
    // final uri = Uri.parse(baseUrl);

    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return ResponseTopicModel.fromMap(data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(dioErrorHandler(e));
    }
  }

  Future<List<TopicModel>?> getAllUserReqress() async {
    try {
      final result = await getAllUser();
      if (result != null) {
        final ResponseTopicModel response = result;
        return response.data;
      }
      return null;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

  void delUser(int id) async {
    final response = await _dio
        .post("https://htapp.rittercoding.com/api/getCategoryTopic/", data: {
      "id": id,
    });
  }
}
