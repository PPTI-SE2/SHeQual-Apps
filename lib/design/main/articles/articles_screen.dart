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
                      color: Color.fromARGB(255, 49, 50, 57)),
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

    Widget gambarArtikel() {
      return Container(
        width: 358,
        height: 212,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/artikel/headline.png"),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
              )
            ]),
      );
    }

    Widget teksArtikel() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 85),
        alignment: Alignment.centerLeft,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  """
                    Catcalling adalah penggunaan kata-kata yang tidak senonoh, ekspresi secara verbal dan non verbal yang kejadiannya terjadi di tempat umum atau publik.
                    Catcalling juga berarti melakukan hal-hal yang mengarah berbau seksual kepada orang yang lewat di jalanan atau berada di tempat umum dan membuat orang yang bersangkutan merasa tidak nyaman atau terancam.\n\nAda 2 jenis Catcalling, yaitu :
                    
                    \tCatcalling Verbal Bentuk pelecehan seksual yang dilakukan dengan memberikan siulan atau komentar mengenai penampilan korban
                    \tCatcalling Non Verbal Bentuk pelecehan seksual yang dilakukan dengan penggunaan gestur fisik untuk memberikan penilaian terhadap penampilan korban.
                    Dampak Catcalling kepada Korban Perilaku Catcalling dianggap pelaku sebagai candaan untuk menarik perhatian korban. Padahal, banyak yang tidak menyadari jika perilaku tersebut dapat menimbulkan trauma bagi para korban. Dampak pada korban catcalling adalah: 
                    Berkurangnya rasa aman dan nyaman. Merasa pergerakannya di ruang publik terbatas 
                    Malu dan tidak percaya diri
                    Mengganggu kesehatan mental.
                    """,
                  style: blackTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
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
                color: Colors.black.withOpacity(0.25))
          ],
          image: DecorationImage(
              image: AssetImage("assets/profile/banner.png"),
              fit: BoxFit.cover),
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
              // belajar(),
              gambarArtikel(),
              teksArtikel(),
            ],
          ),
        ),
      ),
    );
  }
}
