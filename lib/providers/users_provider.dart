import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:dio_provider_sample/repository/ritter_repository.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<TopicModel> listUser = [];
  String errorMessage = "";

  bool get isloading => _isLoading;
  set isLoading(bool val) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoading = val;
      notifyListeners();
    });
  }

  UserProvider() {
    initialized();
  }

  void initialized() {
    errorMessage = "";
    getUsers();
  }

  Future<void> getUsers() async {
    //   isLoading = true;
    //   try {

    //   } on CustomError catch (e) {
    //     errorMessage = e.errMsg;
    //     isLoading = false;
    //   }
    //   isLoading = false;
    // }
    final result = await RitterRepository().getAllUserReqress();
    print('reuslt = $result');
    if (result != null) {
      listUser = result;
    }
    notifyListeners();
  }
}
