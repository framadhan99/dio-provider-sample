import 'package:dio/dio.dart';
import 'package:dio_provider_sample/models/custom_error.dart';
import 'package:dio_provider_sample/models/response_mode.dart';
import 'package:dio_provider_sample/models/user_model.dart';
import 'package:dio_provider_sample/services/dio_error_handler.dart';

class ReqresRepository {
  final Dio _dio = Dio();

  Future<ResponseModel?> getAllUser() async {
    const String baseUrl = 'https://reqres.in/api/users?page=2';
    final uri = Uri.parse(baseUrl);

    String ritter = "https://htapp.rittercoding.com/api/getCategoryTopic";

    try {
      final response = await _dio.getUri(uri);
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return ResponseModel.fromMap(data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(dioErrorHandler(e));
    }
  }

  Future<List<User>?> getAllUserReqress() async {
    try {
      final result = await getAllUser();
      if (result != null) {
        final ResponseModel response = result;
        return response.data;
      }
      return null;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
