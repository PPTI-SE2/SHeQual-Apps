import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shequal/design/main/main_screen.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class SuccessQuiz extends StatefulWidget {
  final String poin;
  final UserPreferencesManager userPreferencesManager;
  const SuccessQuiz({super.key, required this.poin, required this.userPreferencesManager});

  @override
  State<SuccessQuiz> createState() => _SuccessQuizState();
}

class _SuccessQuizState extends State<SuccessQuiz> {
  @override
  Widget build(BuildContext context) {
    int poin = int.parse(widget.poin);
    poin *= 10;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  LottieBuilder.asset("assets/lottie/winner.json", width: 400, height: 400,),
                  const SizedBox(height: 20),
                  Text(
                    "Selamat!\nKamu berhasil menyelesaikan quiz\nPoin mu +${(poin)}",
                    style: blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {
                      var user = widget.userPreferencesManager.getUser();
                      user!.poin = (user.poin! + poin);
                      widget.userPreferencesManager.saveUser(user);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(userPreferencesManager: widget.userPreferencesManager)));
                    },
                    color: kPrimaryColor,
                    text: "Kembali",
                    textColor: kWhiteColor,
                    width: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
