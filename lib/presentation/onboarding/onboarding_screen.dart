import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/data/onboarding_data.dart';
import 'package:salon_app/presentation/account/widgets/select_language_widget.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/presentation/auth/login_screen.dart';
import 'package:salon_app/presentation/onboarding/onboarding_content.dart';

/// The onboarding screen widget displays a series of screens to introduce users to the app features.
class OnBoardingScreen extends StatefulWidget {
  /// Constructs a [OnBoardingScreen].
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

/// The state for the [OnBoardingScreen] widget.
class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spacing(height: 20),
            pageIndicator(),
            spacing(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        title: trans(context, key: 'get_started'),
                        yPadding: 12,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onTap: () {
                          navigateToScreen(context, const LoginPage());
                        })),
              ],
            ),
            spacing(height: 20),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            spacing(height: 20),
            const SelectLanguageWidget(alignment: MainAxisAlignment.center),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnBoardingData.list.length,
                itemBuilder: (context, index) {
                  return OnBoardingContent(data: OnBoardingData.list[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the page indicator widget.
  Widget pageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: OnBoardingData.list.length,
      effect: const SlideEffect(
          spacing: 8.0,
          radius: 20,
          dotHeight: 10,
          dotWidth: 10,
          paintStyle: PaintingStyle.fill,
          dotColor: AppColors.grey30,
          activeDotColor: AppColors.primary),
    );
  }
}
