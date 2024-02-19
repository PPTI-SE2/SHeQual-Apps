import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingContent(),
    );
  }
}

class OnBoardingContent extends StatefulWidget {
  const OnBoardingContent({Key? key});

  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Provider.of<AuthProviders>(context, listen: false).isLoggedIn()) {
        print("user logged in");
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> contentTextList = [
      [
        "Berbagi Pengalaman\nDi Forum",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget lacus venenatis, sodales augue luctus, faucibus ipsum. Duis vestibulum urna eget nunc porttitor luctus. Praesent eges tor"
      ],
      [
        "Bermain dan Konsultasi\nDengan Ahlinya",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget lacus venenatis, sodales augue luctus, faucibus ipsum. Duis vestibulum urna eget nunc porttitor luctus. Praesent eges tor"
      ],
      [
        "Mulai Sekarang",
        Column(
          children: [
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signIn);
              },
              color: kPrimaryColor,
              textColor: kWhiteColor,
              text: "Masuk",
              width: 191,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
              color: kInactiveColor,
              textColor: kPrimaryColor,
              text: "Daftar",
              width: 191,
            ),
          ],
        )
      ]
    ];

    Widget imageBoarding(int index) {
      return Container(
        margin: const EdgeInsets.only(top: 35),
        child: Image.asset(
          "assets/onBoarding/img${index + 1}.png",
          width: 358,
          height: 373,
        ),
      );
    }

    Widget contentText(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            Text(
              contentTextList[index][0],
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            (index == 2)
                ? contentTextList[index][1]
                : Text(
                    contentTextList[index][1],
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: PageView.builder(
            itemCount: contentTextList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageBoarding(index),
                  const SizedBox(
                    height: 35,
                  ),
                  contentText(index)
                ],
              );
            }),
      ),
    );
  }
}
