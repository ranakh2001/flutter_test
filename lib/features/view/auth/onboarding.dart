import 'package:doos_doos/features/providers/shared_prefs_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_button.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/constants/const_images.dart';
import 'package:doos_doos/utils/constants/constants.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPref = ref.read(sharedPrefSettings);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ConstImages.onboardingBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor.withAlpha(25),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.onboarding1,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 27.sp,
                  color: Theme.of(context).colorScheme.surface,
                  fontFamily: Constants.cormorantFont,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              Text(
                AppLocalizations.of(context)!.onboarding2,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15.sp,
                  color: Theme.of(context).colorScheme.surface,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              SizedBox(height: 52.h),
              CustomButton(
                title: AppLocalizations.of(context)!.getStarted,
                isOnboarding: true,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routers.login);
                  sharedPref.setFirstTime();
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
