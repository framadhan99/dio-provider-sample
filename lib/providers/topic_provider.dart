import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:dio_provider_sample/repository/topic_repository.dart';
import 'package:flutter/material.dart';

class TopicProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Topic> listTopic = [];

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoading = val;
      notifyListeners();
    });
  }

  TopicProvider() {
    initialized();
  }
  void initialized() async {
    listTopic.clear();
    notifyListeners();
    getAllTopic();
  }

  Future<void> getAllTopic() async {
    isLoading = true;
    try {
      final result = await TopicRepository().getAllTopic();
      if (result != null) {
        listTopic = result;
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> createTopic(String name, BuildContext context) async {
    isLoading = true;

    await TopicRepository().createTopic(name).then((value) {
      isLoading = false;

      Navigator.pop(context);
    });
  }

  Future<void> deleteTopic(int id) async {
    isLoading = true;
    listTopic.removeWhere((element) => element.id == id);
    notifyListeners();
    await TopicRepository().deleteTopicbyId(id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTopic(int id, String name) async {
    isLoading = true;
    await TopicRepository().updateTopic(id, name);
    isLoading = false;
    notifyListeners();
  }
}
