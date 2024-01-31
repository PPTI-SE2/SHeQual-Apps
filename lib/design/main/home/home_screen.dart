import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/card_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 14,
        ),
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 21),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGreyColor,
                  image: const DecorationImage(
                    image: AssetImage("assets/home/profile.png"),
                    fit: BoxFit.contain,
                  )),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 42,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xffF7F7F7),
                ),
                child: Text("Topik apa yang kamu cari ?",
                    style: blackTextStyle.copyWith(
                        fontSize: 13, color: const Color(0xff979799))),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            header(),
            CardHome(),
            CardHome(),
            CardHome(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
