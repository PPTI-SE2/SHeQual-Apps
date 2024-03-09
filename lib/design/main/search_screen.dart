import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/models/article_model.dart';
import 'package:shequal/providers/article_providers.dart';
import 'package:shequal/shared/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

    Widget bodyContent() {
      Widget trendingCard(ArticleModel model) {
        return Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: 208,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kGreyColor,
              image: DecorationImage(
                image: NetworkImage(model.imgArticles.toString()),
                fit: BoxFit.cover,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 70,
                  height: 30,
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/home/icon_love.png",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "7986",
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 118,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0)
                    ],
                  ),
                ),
                child: Text(
                  model.title.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        );
      }

      Widget articleCard(ArticleModel model) {
        Widget commentLikes() {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/home/icon_love.png",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "36",
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/home/icon_comment.png",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "20",
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/artikel/icon_bookmark.png",
                    width: 25,
                    height: 25,
                  )
                ],
              ),
            ),
          );
        }

        return Container(
          width: double.infinity,
          height: 273,
          margin: const EdgeInsets.only(bottom: 30, right: 20),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 227,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: kGreyColor,
                  image: DecorationImage(
                    image: NetworkImage(model.imgArticles.toString()),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 123,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.25),
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.title.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          commentLikes(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Hari ini",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      Provider.of<ArticleProviders>(context, listen: false)
                          .articles
                          .take(3)
                          .map((data) => trendingCard(data))
                          .toList(),
                ),
              ),
            ),
            Text(
              "Terbaru",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: Provider.of<ArticleProviders>(context, listen: false)
                  .articles
                  .take(5)
                  .map((data) => articleCard(data))
                  .toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              bodyContent(),
            ],
          ),
        ),
      )),
    );
  }
}
