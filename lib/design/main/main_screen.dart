import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/home/home_screen.dart';
import 'package:shequal/design/main/profile/profile_screen.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button_navigation_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Widget customNavigationBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
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
      );
    }

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomeScreen();
        case 1:
        // return TransactionPage();
        case 2:
        // return WalletPage();
        case 3:
          return const ProfileScreen();
        case 4:
        // return SettingPage();
        default:
          return const HomeScreen();
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
                customNavigationBar(),
              ],
            );
          },
        ),
      ),
    );
  }
}
