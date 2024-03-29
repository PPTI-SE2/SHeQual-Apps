import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/home/detail_post_screen.dart';
import 'package:shequal/models/post_model.dart';
import 'package:shequal/providers/post_providers.dart';
import 'package:shequal/shared/server-config.dart';
import 'package:shequal/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class CardHome extends StatelessWidget {
  final PostModel postModel;
  final UserPreferencesManager userPreferencesManager;
  const CardHome({super.key, required this.postModel, required this.userPreferencesManager});

  @override
  Widget build(BuildContext context) {
    String formatTime(String timestamp) {
      // Parse the timestamp into a DateTime object
      DateTime dateTime = DateTime.parse(timestamp);
      // Format the DateTime object to display only the time
      String formattedTime = DateFormat.Hm().format(dateTime);
      return formattedTime;
    }

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProfileScreen(userPreferencesManager: userPreferencesManager)));
                },
                child: Container(
                  width: 46,
                  height: 46,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xffDBD7EC),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(postModel.imgProfile.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel.username.toString(),
                    style: purpleTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    formatTime(postModel.createdAt.toString()),
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
          postModel.title.toString(),
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
            image: DecorationImage(
              image: NetworkImage("$baseUrl/uploads/${postModel.imgPost}"),
              fit: BoxFit.cover,
            ),
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
                      postModel.likes.toString(),
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
                      postModel.comments!.length.toString(),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FutureBuilder(
                      future: Provider.of<PostProviders>(context, listen: false)
                          .checkLike(
                              postsId: postModel.id,
                              usersId: postModel.usersId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // or any loading indicator
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DetailPostScreen(
                            postModel: postModel,
                            isLike: snapshot.data as bool,
                            userPreferencesManager: userPreferencesManager,
                          );
                        }
                      },
                    ),
                  ),
                );
                // .then((_) {
                //   // Call the refresh method on the home screen when the next page is popped
                //   HomeScreen homeScreen = context.findAncestorWidgetOfExactType<HomeScreen>();
                //   homeScreen?._refreshData();
                //   Navigator.pop(context);
                // });;
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
