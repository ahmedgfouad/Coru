import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/profile/view/view_model/localization_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationView extends StatefulWidget {
  const LocalizationView({super.key});

  @override
  State<LocalizationView> createState() => _LocalizationViewState();
}

class _LocalizationViewState extends State<LocalizationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => LocalizationController(),
          child: Column(
            children: [
              // const AlemniAppBar(title: 'Language'),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Consumer<LocalizationController>(
                  builder: (context, provider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Suggested',
                        style: AppStyles.textStyle20.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      RadioListTile(
                        activeColor: AppColors.secondaryColor,
                        title: Text(
                          'English',
                          style: AppStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        value: provider.english,
                        groupValue: provider.index,
                        onChanged: (int? tileIndex) =>
                            provider.toggleLanguage(tileIndex!),
                      ),
                      RadioListTile(
                        activeColor: AppColors.secondaryColor,
                        title: Text(
                          'عربي',
                          style: AppStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        value: provider.arabic,
                        groupValue: provider.index,
                        onChanged: (int? tileIndex) =>
                            provider.toggleLanguage(tileIndex!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}