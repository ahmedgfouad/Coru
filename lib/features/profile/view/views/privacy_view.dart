import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyViwe extends StatelessWidget {
  const PrivacyPolicyViwe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const AlemniAppBar(title: "Privacy Policy"),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        '1. Types data we collect',
                        style: AppStyles.textStyle18,

                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Text(
                        """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.
                      """,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      const Text(
                        '2. Use of your personal data',
                        style: AppStyles.textStyle18,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Text(
                        """
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.
                      """,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      const Text(
                        '3. Disclosure of your personal data',
                        style: AppStyles.textStyle18,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Text(
                        """
At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.

Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.

Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus
                    """,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
