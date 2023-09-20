// ignore_for_file: avoid_print

import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/chat/views/header_chats_view.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/features/cart/view/views/cart_view.dart';
import 'package:elearning_app/features/home/view/views/home_view.dart';
import 'package:elearning_app/features/my_courses/view/views/my_courses_view.dart';
import 'package:elearning_app/features/profile/view/views/profile_view.dart';
import 'package:elearning_app/handlers/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
    AppImages.cart,
    AppImages.chat,
    AppImages.profile,
  ];

  @override
  Widget build(BuildContext context) {
    // double MediaQueryHelper.width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> screens = [
      {
        'title': "${getLang(context, 'home')}",
        'screen': const HomeView(),
      },
      {
        'title': "${getLang(context, 'my_courses')}",
        'screen': const MyCoursesView(),
      },
      {
        'title': "${getLang(context, 'cart')}",
        'screen': const CartView(),
      },
      {
        'title': "${getLang(context, 'chat')}",
        'screen': const HeaderChatsView(),
      },
      {
        'title': "${getLang(context, 'profile')}",
        'screen': const ProfileView(),
      }
    ];

    return Scaffold(
      body: screens[currentIndex]['screen'],
      
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(
          MediaQueryHelper.width * .04,
          0,
          MediaQueryHelper.width * .04,
          MediaQueryHelper.height * .006,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(blurRadius: 30, color: Colors.black.withOpacity(.15))
          ],
        ),
        height: MediaQueryHelper.width * 0.155,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQueryHelper.width * 0.006,
              vertical: MediaQueryHelper.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                listOfIcons.length,
                (index) => Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 4),
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
                              horizontal: MediaQueryHelper.width * 0.01),
                          width: index == currentIndex
                              ? MediaQueryHelper.width * 0.17
                              : MediaQueryHelper.width * 0.159,
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
                                  width: MediaQueryHelper.width * 0.034,
                                  height: MediaQueryHelper.height * 0.034,
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
