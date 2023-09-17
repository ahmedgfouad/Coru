import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/data/model/lessons_model.dart';
import 'package:flutter/material.dart';

class LessonDetailsView extends StatelessWidget {
  final Map lesson;
  const LessonDetailsView({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          DefaultAppBar(
            title: 'Lesson Details',
          ),
          Image.network(
              'https://picsum.photos/200/300',
              height: MediaQuery.sizeOf(context).height * .3,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text("Lesson ${lesson['index']+1}: ${lesson['lesson'].title}"),
                Text('Description: ${lesson['lesson'].description!}'),
              ],),
            )
        ]),
      )),
    );
  }
}
