import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget ContainerKotak() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Text('Tahukah Kamu\nApa itu Catcalling?',
                style: blackTextStyle.copyWith(fontSize: 25, fontWeight: bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '10 November 2023',
                  style: purpleTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                      color: Color(0xFF7079F1)),
                ),
                Text(
                  'Ara Chinda',
                  style: purpleTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget NavBarAtas() {
      return Row(
        children: [
          Icon(Icons.arrow_back_ios, size: 24),
          const SizedBox(width: 10),
          Text('Artikel',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: medium)),
          const Spacer(),
          Icon(Icons.search, size: 24)
        ],
      );
    }

    Widget belajar() {
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: kRedColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25)
            )
          ],
          image: DecorationImage(
            image: AssetImage("assets/profile/banner.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: kBlackColor,  
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: kBlackColor,  
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: kBlackColor,  
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: kBlackColor,  
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            children: [
              NavBarAtas(),
              ContainerKotak(),
              belajar(),
            ],
          ),
        ),
      ),
    );
  }
}
