import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/consultation/detail_consultant.dart';
import 'package:shequal/models/consultant_model.dart';
import 'package:shequal/providers/appoiment_providers.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class ConsultantList extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  final String date;
  final String time;
  const ConsultantList(
      {super.key,
      required this.userPreferencesManager,
      required this.time,
      required this.date});

  @override
  State<ConsultantList> createState() => _ConsultantListState();
}

class _ConsultantListState extends State<ConsultantList> {
  late Future<void> _consultants;

  Future<void> initData() async {
    await Provider.of<AppoimentProviders>(context, listen: false)
        .getConsultantByDate(date: widget.date, time: widget.time);
  }

  @override
  void didChangeDependencies() {
    _consultants = initData();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ConsultantList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _consultants = initData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: kBlackColor),
          ),
          const SizedBox(width: 10),
          Text(
            "Hai Asley, ini konsultan yang tersedia",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 14,
        ),
        margin: const EdgeInsets.only(
          bottom: 15,
          top: 15,
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
                onTap: () {},
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
                  child: Text(
                    "Cari konsultan yang kamu inginkan",
                    style: blackTextStyle.copyWith(
                      fontSize: 13,
                      color: const Color(0xff979799),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget consultantCard(ConsultantModel consultant) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 12),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kGreyColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  consultant.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  "Biopsychologists",
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                  ],
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailConsultant(
                      userPreferencesManager: widget.userPreferencesManager,
                      date: widget.date,
                      time: widget.time,
                      consultantModel: consultant,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Pesan",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _consultants,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<ConsultantModel?> consultants =
                  Provider.of<AppoimentProviders>(context, listen: false)
                      .consultants;
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(),
                      header(),
                      Column(
                        children:
                            consultants.map((e) => consultantCard(e!)).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              backgroundColor: kWhiteColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
