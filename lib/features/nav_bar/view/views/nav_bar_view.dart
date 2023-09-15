// ignore_for_file: avoid_print

import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/guest_controller.dart';
import 'package:elearning_app/features/chat/views/chat_view.dart';
import 'package:elearning_app/features/home/view/view/home_view.dart';
import 'package:elearning_app/features/my_courses/view/views/my_courses_view.dart';
import 'package:elearning_app/features/profile/view/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> { 

  int currentIndex = 0;
  List<String> listOfIcons = [
    AppImages.home,
    AppImages.myCourses,
    // AppImages.cart,
    AppImages.chat,
    AppImages.profile,
  ];
  @override
  Widget build(BuildContext context) {
    double customWidth = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> screens = [
      {
        'title': "home",
        'screen': const HomeView(),
      },
      {
        'title': "myCourse",
        'screen': const MyCoursesView(),
      },
      // {
      //   'title': S.of(context).cart,
      //   'screen': const CartScreen(),
      // },
      {
        'title': "chat",
        'screen': const ChatView(),
      },
      {
        'title': "profile",
        'screen': const ProfileView(),
      }
    ];

    return Scaffold(
      body: screens[currentIndex]['screen'],
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(
            customWidth * .04, 0, customWidth * .04, customWidth * .02),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(blurRadius: 30, color: Colors.black.withOpacity(.15))
          ],
        ),
        height: customWidth * 0.155,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: customWidth * 0.006, vertical: customWidth * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          print(currentIndex);
                        },
                        child: AnimatedContainer(
                          height: MediaQuery.of(context).size.height,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: EdgeInsets.symmetric(
                              horizontal: customWidth * 0.01),
                          width: index == currentIndex
                              ? customWidth * 0.17
                              : customWidth * 0.159,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: index == currentIndex
                                  ? MainAxisAlignment.spaceEvenly
                                  : MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  listOfIcons[index],
                                  width:
                                      MediaQuery.of(context).size.width * 0.036,
                                  height: MediaQuery.of(context).size.height *
                                          0.036 -
                                      10,
                                  colorFilter: ColorFilter.mode(
                                      /* index == currentIndex
                                          ? Theme.of(context).colorScheme.primary
                                          : */
                                      Theme.of(context).iconTheme.color!,
                                      BlendMode.srcIn),
                                ),
                                AnimatedSize(
                                    duration: const Duration(seconds: 1),
                                    child: SizedBox(
                                      height: index == currentIndex
                                          ? MediaQuery.of(context).size.height *
                                              0.005
                                          : 0,
                                    )),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: const Duration(seconds: 1),
                                  child: index == currentIndex
                                      ? FittedBox(
                                          child: Text(
                                            screens[index]['title'],
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background),
                                          ),
                                        )
                                      : Container(),
                                ),
                              ]),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
