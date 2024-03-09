import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/models/comment_model.dart';
import 'package:shequal/models/post_model.dart';
import 'package:shequal/providers/post_providers.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class DetailPostScreen extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  PostModel? postModel;
  bool? isLike;
  DetailPostScreen({super.key, this.postModel, this.isLike, required this.userPreferencesManager});

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String getTimeDifference(String timestamp) {
      // Parse the timestamp into a DateTime object
      DateTime dateTime = DateTime.parse(timestamp);

      // Get the current time
      DateTime now = DateTime.now();

      // Calculate the difference between the two times
      Duration difference = now.difference(dateTime);

      // Get the absolute difference in minutes
      int differenceInMinutes = difference.inMinutes.abs();

      // Calculate the difference in hours
      int differenceInHours = differenceInMinutes ~/ 60;

      // Calculate the difference in days
      int differenceInDays = differenceInHours ~/ 24;

      // Format the difference based on the magnitude
      if (differenceInDays > 0) {
        return '$differenceInDays hari yang lalu';
      } else if (differenceInHours > 0) {
        return '$differenceInHours jam yang lalu';
      } else {
        return '$differenceInMinutes menit yang lalu';
      }
    }

    String waktu = getTimeDifference(widget.postModel!.createdAt.toString());
    TextEditingController commentController = TextEditingController(text: "");

    Widget banner() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 1.8,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.only(bottom: 26),
        decoration: BoxDecoration(
          color: kGreyColor,
          image: DecorationImage(
            image: NetworkImage("${widget.postModel!.imgPost}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<PostProviders>(context, listen: false).getPosts();
              });
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
            GestureDetector(
              onTap: () async {
                bool isLiked =
                    await Provider.of<PostProviders>(context, listen: false)
                        .likePost(
                            postsId: widget.postModel!.id,
                            usersId: widget.postModel!.usersId);
                if (isLiked) {
                  bool updatedIsLiked =
                      await Provider.of<PostProviders>(context, listen: false)
                          .checkLike(
                              postsId: widget.postModel!.id,
                              usersId: widget.postModel!.usersId);
                  setState(() {
                    widget.isLike = updatedIsLiked;
                  });
                }
              },
              child: Image.asset(
                (widget.isLike == true)
                    ? "assets/home/icon_love.png"
                    : "assets/home/icon_love_line.png",
                width: 30,
                height: 30,
                color: (widget.isLike == true) ? Colors.pink : kInactiveColor,
              ),
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
                "${widget.postModel!.title}",
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${widget.postModel!.content}",
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
                      widget.postModel!.likes.toString(),
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
                      widget.postModel!.comments!.length.toString(),
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
                  text: "${waktu[0] + waktu[1]} ",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                TextSpan(
                  text:
                    waktu.split(" ")[1] + " " + waktu.split(" ")[2] + " " + waktu.split(" ")[3],
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
                controller: commentController,
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
            GestureDetector(
              onTap: () async {
                CommentModel? commentResult = 
                    await Provider.of<PostProviders>(context, listen: false).addComment(
                      postId: widget.postModel!.id.toString(), 
                      userId: widget.userPreferencesManager.getUser()!.id.toString(), 
                      details: commentController.text
                    );

                if(commentResult != null) {
                  setState(() {
                    widget.postModel!.comments!.add(commentResult);
                    commentController.text = "";
                  });
                }
              }, 
              child: Image.asset(
                "assets/home/icon_paper_plane.png",
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      );
    }

    Widget commentSection(CommentModel commentModel) {
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
                    image: DecorationImage(
                      image: NetworkImage(widget.postModel!.imgProfile.toString()),
                      fit: BoxFit.cover,
                    ),
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
                      commentModel.username.toString(),
                      style: purpleTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Text(
                        commentModel.details.toString(),
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
        child: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width / 1.8,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(background: banner()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            headerProfile(),
            bodyContent(),
            commentLikes(),
            uploadTime(),
            commentBar(),
            Column(
              children: widget.postModel!.comments!.map((comment) {
                return commentSection(comment);
              }).toList(),
            ),
          ]))
        ]),
      ),
    );
  }
}
