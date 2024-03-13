import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/articles/article_screen.dart';
import 'package:shequal/design/main/consultation/consultation_screen.dart';
import 'package:shequal/design/main/home/home_screen.dart';
import 'package:shequal/design/main/profile/profile_screen.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button_navigation_item.dart';

class MainScreen extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  const MainScreen({super.key, required this.userPreferencesManager});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Widget customNavigationBar(int currentIndex) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            (currentIndex == 0) ? Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.addPost);
                },
                child: Container(
                  width: 58,
                  height: 58,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 10
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffE1AFEE),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text("+", style: whiteTextStyle.copyWith(
                      fontSize: 40,
                      fontWeight: semiBold,
                    ),),
                  ),
                ),
              ),
            ): const SizedBox(),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(
                bottom: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonNavigationItem(
                    index: 0,
                    imageUrl: 'assets/navbar/icon_home.png',
                  ),
                  CustomButtonNavigationItem(
                    index: 1,
                    imageUrl: 'assets/navbar/icon_booking.png',
                  ),
                  CustomButtonNavigationItem(
                    index: 2,
                    imageUrl: 'assets/navbar/icon_card.png',
                  ),
                  CustomButtonNavigationItem(
                    index: 3,
                    imageUrl: 'assets/navbar/icon_person.png',
                  ),
                  // CustomButtonNavigationItem(
                  //   index: 4,
                  //   imageUrl: 'assets/navbar/icon_settings.png',
                  // ),
                ],
              ),
            ),
          ],
      );
    }

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeScreen(userPreferencesManager: widget.userPreferencesManager);
        case 1:
          return ArticleScreen(userPreferencesManager: widget.userPreferencesManager,);
        case 2:
          return ConsultationScreen(userPreferencesManager: widget.userPreferencesManager,);
        case 3:
          return ProfileScreen(userPreferencesManager: widget.userPreferencesManager);
        default:
          return HomeScreen(userPreferencesManager: widget.userPreferencesManager,);
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Consumer<PageProviders>(
          builder: (context, pageProviders, _) {
            return Stack(
              children: [
                buildContent(pageProviders.getIndex()),
                customNavigationBar(pageProviders.getIndex()),
              ],
            );
          },
        ),
      ),
    );
  }
}
