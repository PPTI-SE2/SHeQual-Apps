import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/articles/details_article_screen.dart';
import 'package:shequal/models/article_model.dart';
import 'package:shequal/providers/article_providers.dart';
import 'package:shequal/shared/theme.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late Future<void> _articleModel;

  Future<void> initData() async {
    await Provider.of<ArticleProviders>(context, listen: true).getArticles();
  }

  @override
  void didChangeDependencies() {
    _articleModel = initData();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ArticleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _articleModel = initData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Artikel",
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: medium,
            ),
          ),
          Icon(
            Icons.search,
            color: kBlackColor,
          ),
        ],
      );
    }

    Widget articleCard(ArticleModel articleModel) {
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

      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailArticleScreen(articleModel: articleModel,)));
        },
        child: Container(
          width: double.infinity,
          height: 273,
          margin: const EdgeInsets.only(bottom: 30),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 227,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(articleModel.imgArticles.toString()),
                      fit: BoxFit.cover,
                    ),
                  borderRadius: BorderRadius.circular(18),
                  color: kGreyColor,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          articleModel.title.toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: semiBold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
        ),
      );
    }

    return FutureBuilder(
      future: _articleModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          List<ArticleModel> articles =
              Provider.of<ArticleProviders>(context, listen: false).articles;
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    header(),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: articles.map((data) {
                        return articleCard(data);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
