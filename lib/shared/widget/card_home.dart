import 'package:flutter/material.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDBD7EC),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gajah Terbang",
                    style: purpleTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "14:30",
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            "assets/home/icon-more-vertical.png",
            width: 24,
            height: 24,
          ),
        ],
      );
    }

    Widget title() {
      return Container(
        width: 250,
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          "Keluhan Rumah Tangga diriku",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: medium,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    Widget contentBody({String image = ""}) {
      return Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      );
    }

    Widget commentLikes() {
      return SizedBox(
        width: double.infinity,
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
                  width: 25,
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.post);
              },
              child: Image.asset(
                "assets/home/icon_expand.png",
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 340,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          title(),
          contentBody(),
          commentLikes(),
        ],
      ),
    );
  }
}
