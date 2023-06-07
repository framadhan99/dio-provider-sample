import 'package:dio_provider_sample/models/topic_model.dart';
import 'package:dio_provider_sample/providers/topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTopic extends StatefulWidget {
  const UpdateTopic({super.key, required this.topic});

  final Topic topic;

  @override
  State<UpdateTopic> createState() => _UpdateTopicState();
}

class _UpdateTopicState extends State<UpdateTopic> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = widget.topic.name;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopicProvider(),
      child: Consumer<TopicProvider>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Update'),
            ),
            body: Column(
              children: [
                TextField(
                  controller: controller,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<TopicProvider>()
                        .updateTopic(widget.topic.id, controller.text);
                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
