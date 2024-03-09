import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/models/user_model.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  const ProfileScreen({super.key, required this.userPreferencesManager});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel _userModel = UserModel(  // Initialize _userModel here
    id: '',
    username: '',
    age: null,
    email: '',
    imgProfile: '',
    poin: null,
    createdAt: null,
    updatedAt: null,
    token: '',
  );

  @override
  void initState() {
    _initUser();
    super.initState();
  }

  Future<void> _initUser() async {
    final userModel = widget.userPreferencesManager.getUser();
    if (userModel != null) {
      setState(() {
        _userModel = userModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String convertDate() {
      String timestamp = _userModel.createdAt.toString();
      DateTime dateTime = DateTime.parse(timestamp);
      String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
      return formattedDate; // Output: 16 Mei 2024
    }
    AuthProviders authProviders = Provider.of<AuthProviders>(context);


    Widget banner() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: kGreyColor,
          image: const DecorationImage(
            image: AssetImage("assets/profile/banner.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: const Icon(
                //     Icons.arrow_back,
                //     size: 30,
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editProfile);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kWhiteColor.withOpacity(0.7),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    authProviders.logout();
                    Provider.of<PageProviders>(context, listen: false).setIndex(0);
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.root, (route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kRedColor,
                    ),
                    child: Text(
                      "Logout",
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Transform.translate(
              offset: Offset(0, MediaQuery.of(context).size.width / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 126,
                    height: 126,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/home/profile.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      color: kGreyColor,
                    ),
                  ),
                  Text(
                    _userModel.username.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    "nono thing's",
                    style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                        color: kBlackColor.withOpacity(0.5)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget joinedDate() {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20),
          child: Text(
            "Bergabung sejak\n${convertDate()}",
            style: redTextStyle.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget postUserSection() {
      Widget commentLikes() {
        return Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
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
              RichText(
                text: TextSpan(
                  style: greyTextStyle,
                  children: [
                    TextSpan(
                        text: "2",
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        )),
                    const TextSpan(text: " jam lalu")
                  ],
                ),
              )
            ],
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile user
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/home/profile.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Text(
                  "${_userModel.username}",
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
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "semalem liat berita banyak para suami-suami ngelarang istri nya kerja, kek mana lah woyy??!!?!? gimana tanggapan para wanita???",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
            commentLikes(),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          banner(),
          joinedDate(),
          const SizedBox(
            height: 60,
          ),
          postUserSection(),
          const Padding(padding: EdgeInsets.only(bottom: 30), child: Divider()),
          postUserSection(),
          const Padding(padding: EdgeInsets.only(bottom: 30), child: Divider()),
        ],
      ),
    );
  }
}
