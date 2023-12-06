import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/generated/l10n.dart';
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
            title: S.of(context).lesson_details,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.sizeOf(context).height * .3,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  )
                ]),
          ),
          SizedBox(
            height: MediaQueryHelper.height * .02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Lesson ${lesson['index'] + 1}: ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20),
                    ),
                    Text(
                      "${lesson['lesson'].title}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQueryHelper.height * .02,
                ),
                Text(
                  '${S.of(context).description} :',
                  style: AppStyles.textStyle20
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQueryHelper.height * .01,
                ),
                Text('${lesson['lesson'].description!}',
                    style: const TextStyle(color: Colors.grey, fontSize: 15)),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
