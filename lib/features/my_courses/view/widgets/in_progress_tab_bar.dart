import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/view_model/home_controller.dart';

class InProgressTabBar extends StatelessWidget {
  const InProgressTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          10,
          (index) => Consumer<HomeController>(
            builder: (context, value, child) => VerticalCourseCard(isProgress: true,
              course: value.courses![0],
              index: 1,
            ),
          ),
        ),
      ),
    );
  }
}
