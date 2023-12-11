import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/features/home/view/widgets/custom_tab_bar.dart';
import 'package:elearning_app/features/my_courses/view/widgets/complete_tab_bar.dart';
import 'package:elearning_app/features/my_courses/view/widgets/in_progress_tab_bar.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({super.key});

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              DefaultAppBar(title: S.of(context).my_courses),
              CustomTabBar(
                tabController: _tabController,
                viewsTitle: [
                  Tab(text: S.of(context).in_progress),
                  Tab(text: S.of(context).commplete),
                ],
                viewsBody: const [InProgressTabBar(), CompleteTabBar()],
              )
            ],
          ),
        ),
      ),
    );
  }
}
