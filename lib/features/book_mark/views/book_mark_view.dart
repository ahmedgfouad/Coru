import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarkView extends StatelessWidget {
  BookMarkView({super.key});

  final CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  final CollectionReference allCourses =
      FirebaseFirestore.instance.collection(courseDetailsCollectionName);

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DefaultAppBar(isHome: false, title: 'Book Mark'),
            Expanded(
              child: StreamBuilder(
                  stream: allUsersInfo.doc(userId).snapshots(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      var data1 = snapShot.data!.data();
                      UserInfoModel userdata =
                          UserInfoModel.fromJson(data1 as Map<String, dynamic>);

                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: userdata.bookMark!.length,
                        itemBuilder: (context, index) {
                          return StreamBuilder(
                            stream: allCourses
                                .doc(userdata.bookMark![index])
                                .snapshots(),
                            builder: (context, snapShot) {
                              var data2 = snapShot.data!.data();

                              CourseDetailsModel courseDetailsModel =
                                  CourseDetailsModel.fromJson(
                                data2 as Map<String, dynamic>,
                              );

                              if (snapShot.hasData) {
                                return Consumer<HomeController>(
                                  builder: (
                                    BuildContext context,
                                    HomeController provider,
                                    Widget? child,
                                  ) =>
                                      VerticalCourseCard(
                                    course: courseDetailsModel,
                                    isCart: true,
                                    deleateOnPressed: () {
                                      provider.delelteCorrseFormBookMark(index);
                                    },
                                  ),
                                );
                              }
                              if (snapShot.hasError) {
                                return const Text('erro');
                              }
                              return const CircularProgressIndicator();
                            },
                          );
                        },
                      );
                    }
                    if (snapShot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
