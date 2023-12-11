import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsAppBar extends StatelessWidget {
  final String image;
  const CourseDetailsAppBar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 100,
      leading: Stack(
        children: [
          Positioned(
            top: 7,
            left: -22,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 14.r,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQueryHelper.width * 0.04,
              ),
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 4,
              ),
              SizedBox(
                width: MediaQueryHelper.width * 0.02,
              ),
              CustomIconButton(
                iconImage: AppImages.arrowBack,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
      floating: true,
      foregroundColor: Colors.white,
      expandedHeight: MediaQueryHelper.height * 0.37,
      backgroundColor: Colors.white,
      elevation: 1.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          image,
          fit: BoxFit.fill,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0.r),
              topRight: Radius.circular(30.0.r),
            ),
          ),
          child: Container(
            width: MediaQueryHelper.width * 0.1,
            height: MediaQueryHelper.height * 0.005,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
        ),
      ),
    );
  }
}
