import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultAppBar extends StatelessWidget {
  final bool isHome;
  final bool showBack;
  final bool showBookmarks;
  final bool showAvatar;
  final bool showSearch;
  // final bool showBookmarks;
  // final bool showBack;
  final String? title;

  const DefaultAppBar(
      {super.key,
      this.isHome = false,
      this.title,
      this.showBack = true,
      this.showBookmarks = true,
      this.showAvatar = true,
      this.showSearch = true});

  @override
  Widget build(BuildContext context) {
    CollectionReference userInfoReference =
        FirebaseFirestore.instance.collection('users_info');

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.r),
      child: Stack(children: [
        Positioned(
          top: MediaQuery.sizeOf(context).height * .011,
          // left: isArabic() ? 0 : MediaQuery.sizeOf(context).width * -1.03,
          // right: isArabic() ? MediaQuery.sizeOf(context).width * -1.03 : 0,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 14.r,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 4,
            ),
            isHome
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  )
                : Container(),
            isHome && showAvatar
                ? FutureBuilder(
                    future: userInfoReference
                        .where('user_id',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        Map userData = snapShot.data!.docs[0].data() as Map;
                        if (userData['image_profile_rul'] != null) {
                          return CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            radius: 23.r,
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundImage:
                                  NetworkImage(userData['image_profile_rul']),
                            ),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            radius: 23.r,
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundImage:
                                  const AssetImage(AppImages.avatar),
                            ),
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
                : Row(
                    children: [
                      showBack
                          ? IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            )
                          : Container(
                              width: 16,
                            ),
                      Text(
                        title ?? "",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
            const Spacer(),
            // CustomIconButton(
            //   iconImage: AppImages.notification,
            //   onPressed: () => AppRoutes.pushNamedNavigator(
            //       context: context, routeName: Routes.notification),
            // ),
            // !showBookmarks
            //     ? Container()
            //     : CustomIconButton(
            //         iconImage: AppImages.bookmark,
            //         onPressed: () => AppRoutes.pushNamedNavigator(
            //             context: context, routeName: Routes.bookmarkedCourses),
            //       ),
            // !showSearch
            //     ? Container() 
            //      CustomIconButton(
            //         iconImage: AppImages.search,
            //         onPressed: () {
            //           defaultNavigator(context, const SearchScreen());
            //         }),
          ],
        ),

        /* isHome
            ? Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  FutureBuilder(
                      future: userInfoReference
                          .where('user_id',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .get(),
                      builder: (context, snapShot) {
                        if (snapShot.hasData) {
                          Map userData = snapShot.data!.docs[0].data() as Map;
                          if (userData['image_profile_rul'] != null) {
                            return CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              radius: 23.r,
                              child: CircleAvatar(
                                radius: 22.r,
                                backgroundImage:
                                    NetworkImage(userData['image_profile_rul']),
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              radius: 23.r,
                              child: CircleAvatar(
                                radius: 22.r,
                                backgroundImage:
                                    const AssetImage(AppImages.avatar),
                              ),
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  const Spacer(),
                  CustomIconButton(
                    iconImage: AppImages.notification,
                    onPressed: () => AppRoutes.pushNamedNavigator(
                        context: context, routeName: Routes.notification),
                  ),
                  CustomIconButton(
                    iconImage: AppImages.bookmark,
                    onPressed: () => AppRoutes.pushNamedNavigator(
                        context: context, routeName: Routes.bookmarkedCourses),
                  ),
                  CustomIconButton(
                      iconImage: AppImages.search,
                      onPressed: () {
                        defaultNavigator(context, const SearchScreen());
                      }),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 4,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
     */
      ]),
    );
  }
}
