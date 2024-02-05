import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget banner() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 1.8,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.only(bottom: 26),
        decoration: BoxDecoration(
          color: kGreyColor,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 30,
              height: 30,
            ),
          ),
        ),
      );
    }

    Widget headerProfile() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: const Color(0xffDBD7EC),
                ),
              ),
            ),
            Text(
              "Gajah Terbang",
              style: purpleTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const Spacer(),
            Image.asset(
              "assets/home/icon_love_line.png",
              width: 30,
              height: 30,
            ),
          ],
        ),
      );
    }

    Widget bodyContent() {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Keluh Kesah\nRumah Tangga",
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget lacus venenatis, sodales augue luctus, faucibus ipsum. Duis vestibulum urna eget nunc porttitor luctus. Praesent eges tor",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ));
    }

    Widget commentLikes() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    "20",
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
                      "30",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget uploadTime() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              style: greyTextStyle,
              children: [
                TextSpan(
                  text: "4 ",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                TextSpan(
                  text: "jam lalu",
                  style: greyTextStyle,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget commentBar() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(top: 24),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                maxLines: null, // or set it to a specific number if needed
                decoration: InputDecoration(
                  hintText: "Write a comment",
                  hintStyle: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: kInactiveColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: kBlackColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Image.asset(
              "assets/home/icon_paper_plane.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
      );
    }

    Widget commentSection() {
      return Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
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
                      "Ksatria Cahaya",
                      style: purpleTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget lacus venenatis, sodales augue luctus",
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.left,
                        ),
                    ),
                    
                  ],
                ),
              ],
            ),
            Image.asset(
              "assets/home/icon_love_line.png",
              width: 25,
              height: 25,
              color: kInactiveColor,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers:[
            SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width / 1.8,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: banner()
            ),
          ),
            SliverList(
              delegate: SliverChildListDelegate([
              headerProfile(),
              bodyContent(),
              commentLikes(),
              uploadTime(),
              commentBar(),
              commentSection(),
              commentSection(),
              commentSection(),
              commentSection(),
            ]))
          ]
        ),
      ),
    );
  }
}
