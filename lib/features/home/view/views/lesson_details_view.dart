import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonDetailsView extends StatefulWidget {
  final Map lesson;
  const LessonDetailsView({super.key, required this.lesson});

  @override
  State<LessonDetailsView> createState() => _LessonDetailsViewState();
}

class _LessonDetailsViewState extends State<LessonDetailsView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.lesson['lesson'].link);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBar(
                title: S.of(context).lesson_details,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: MediaQuery.sizeOf(context).height / 2.3,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: YoutubePlayer(controller: _controller),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lesson ${widget.lesson['index'] + 1}: ",
                          style: AppStyles.textStyle18,
                        ),
                        SizedBox(
                          width: MediaQueryHelper.width / 1.5,
                          child: Text(
                            "${widget.lesson['lesson'].title}",
                            style: AppStyles.textStyle18
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${S.of(context).description} :',
                      style: AppStyles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQueryHelper.height * .01,
                    ),
                    Text(
                      '${widget.lesson['lesson'].description!}',
                      style:
                          AppStyles.textStyle14.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
