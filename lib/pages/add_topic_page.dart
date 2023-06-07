import 'package:dio_provider_sample/providers/topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTopicPage extends StatefulWidget {
  const AddTopicPage({
    super.key,
  });

  @override
  State<AddTopicPage> createState() => _AddTopicPageState();
}

class _AddTopicPageState extends State<AddTopicPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopicProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Topic'),
        ),
        body: Consumer<TopicProvider>(
          builder: (context, value, child) => Column(
            children: [
              TextField(
                controller: controller,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<TopicProvider>()
                        .createTopic(controller.text, context);
                  },
                  child: value.isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Save'),
                ),
              ),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}
