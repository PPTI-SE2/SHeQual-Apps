import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [OnBoardingContent()],
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      BoxDecoration conditionStyle(bool isActive) {
        if(!isActive) {
          return BoxDecoration(
            color: (isActive) ? kPrimaryColor : kInactiveColor,
            borderRadius: BorderRadius.circular(
              (isActive) ? 10 : 0
            ),
            shape: BoxShape.circle,
          );
        }
        return BoxDecoration(
          color: (isActive) ? kPrimaryColor : kInactiveColor,
          borderRadius: BorderRadius.circular(
            (isActive) ? 10 : 0
          ),
        );
      }
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (index == 0) ? 56 : 20,
              height: 20,
              decoration: conditionStyle(index == 0)
            ),
            const SizedBox(width: 15,),
            Container(
              width: (index == 1) ? 56 : 20,
              height: 20,
              decoration: conditionStyle(index == 1)
            ),
            const SizedBox(width: 15,),
            Container(
              width: (index == 2) ? 56 : 20,
              height: 20,
              decoration: conditionStyle(index == 2)
            ),
          ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/onBoarding/img1.png",
          width: 358,
          height: 373,
        ),
        const SizedBox(
          height: 35,
        ),
        // indicator(0),
      ],
    );
  }
}
