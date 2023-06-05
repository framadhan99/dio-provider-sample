import 'package:flutter/material.dart';

import 'package:dio_provider_sample/models/user_model.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Column(
      children: [
        Hero(
            tag: user.id,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                user.avatar,
              ))),
            ))
      ],
    ));
  }
}
