import 'package:dio_provider_sample/providers/users_provider.dart';
import 'package:dio_provider_sample/repository/ritter_repository.dart';
import 'package:flutter/material.dart';

import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(' Sample App'),
        ),
        body: Consumer<UserProvider>(builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.listUser.length,
            itemBuilder: (context, index) {
              return Text('${value.listUser[index].name}');
            },
          );
        }),
      ),
    );
  }
}
