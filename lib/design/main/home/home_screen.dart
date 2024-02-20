import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/models/post_model.dart';
import 'package:shequal/providers/post_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/card_home.dart';
import 'package:intl/intl.dart';

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
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.search);
                },
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
            ),
          ],
        ),
      );
    }

    List<PostModel> posts = Provider.of<PostProviders>(context, listen: false).post;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            header(),
            Column(
            children: posts.map((data) {
                return CardHome(postModel: data,);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
