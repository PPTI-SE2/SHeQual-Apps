import 'package:flutter/material.dart';
import 'package:shequal/design/main/articles/quiz_web_view.dart';
import 'package:shequal/models/article_model.dart';
import 'package:shequal/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class DetailArticleScreen extends StatelessWidget {
  final ArticleModel articleModel;
  final UserPreferencesManager userPreferencesManager;
  const DetailArticleScreen({super.key, required this.articleModel, required this.userPreferencesManager});

  @override
  Widget build(BuildContext context) {
    String convertDate() {
      String timestamp = articleModel.createdAt.toString();
      DateTime dateTime = DateTime.parse(timestamp);
      String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
      return formattedDate; // Output: 16 Mei 2024
    }

    Widget containerKotak() {
      Widget gambarArtikel() {
      return Container(
        width: 358,
        height: 212,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(articleModel.imgArticles.toString()),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
              )
            ],
            borderRadius: BorderRadius.circular(15),
            ),
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
                    ${articleModel.content}
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

    Widget button() {
      return CustomButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizWebView(userPreferencesManager: userPreferencesManager,),
            ),
          );
        },
        color: kPrimaryColor,
        text: "Mulai Game",
        textColor: kWhiteColor,
        width: double.infinity,
      );
    }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              articleModel.title.toString(),
              style: blackTextStyle.copyWith(fontSize: 25, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  convertDate(),
                  style: purpleTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 49, 50, 57)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  articleModel.publisher.toString(),
                  style: purpleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
              const SizedBox(height: 20,),
            gambarArtikel(),
                teksArtikel(),
                button(),
          ],
        ),
      );
    }

    Widget navBarAtas() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Detail Artikel',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: medium,
            ),
          ),
        ],
      );
    }

    

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              children: [
                navBarAtas(),
                containerKotak(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
