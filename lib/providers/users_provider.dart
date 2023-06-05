import 'package:dio_provider_sample/models/custom_error.dart';
import 'package:dio_provider_sample/models/user_model.dart';
import 'package:dio_provider_sample/repository/reqress_repository.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<User> listUser = [];
  String errorMessage = "";

  bool get isloading => _isLoading;
  set isLoading(bool val) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoading = val;
      notifyListeners();
    });
  }

  Future<void> getUsers() async {
    isLoading = true;
    try {
      final result = await ReqresRepository().getAllUserReqress();
      if (result != null) {
        listUser = result;
      }
      notifyListeners();
    } on CustomError catch (e) {
      errorMessage = e.errMsg;
      isLoading = false;
    }
    isLoading = false;
  }
}
