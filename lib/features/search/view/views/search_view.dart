import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:elearning_app/features/search/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const DefaultAppBar(title: 'Search'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DefaultSearchBar(
                    onChanged: (value) {
                      Provider.of<HomeController>(context, listen: false)
                          .getSearchedCourses(value);
                    },
                  ),
                  Consumer<HomeController>(
                    builder: (context, value, child) {
                      if (value.courses != null) {
                        return Column(
                          children: List.generate(
                            value.courses!.length,
                            (index) => VerticalCourseCard(
                              course: value.courses![index],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Container(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
