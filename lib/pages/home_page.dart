import 'package:dio_provider_sample/pages/add_topic_page.dart';
import 'package:dio_provider_sample/pages/update_topic.dart';
import 'package:dio_provider_sample/providers/topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopicProvider(),
      child: Consumer<TopicProvider>(builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Topic')),
          body: ListView.builder(
            itemCount: value.listTopic.length,
            itemBuilder: (context, index) {
              final topic = value.listTopic[index];
              return Container(
                height: 40,
                color: Colors.grey[50],
                child: Row(
                  children: [
                    Text(value.listTopic[index].name),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<TopicProvider>()
                            .deleteTopic(value.listTopic[index].id);
                      },
                      child: Icon(Icons.delete),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateTopic(
                                topic: topic,
                              ),
                            )).then((value) {
                          context.read<TopicProvider>().initialized();
                        });
                      },
                      child: Icon(Icons.edit),
                    )
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTopicPage(),
                  )).then((value) {
                context.read<TopicProvider>().getAllTopic();
              });
            },
            child: Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
