import 'package:flutter/material.dart';
import 'package:shequal/design/main/consultation/calendar_screen.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.only(top: 27, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kGreyColor,
        ),
      );
    }

    Widget profile() {
      return Column(
        children: [
          Text(
            "Gwen Ashley",
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreyColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kInactiveColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/consultation/icon-gift.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "135",
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget consultationContent() {
      Widget historySection() {
        Widget cardHistory() {
          return Container(
            width: 170,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.3),
                  offset: const Offset(1, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Budi Taraman",
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "26 Feb 2024",
                      style: blackTextStyle.copyWith(
                          fontSize: 8, overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                    const Spacer(),
                    Text(
                      "17:00 WIB",
                      style: blackTextStyle.copyWith(
                          fontSize: 8, overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Row(
              children: [
                Text(
                  "Riwayat Pesanan Anda",
                  style: purpleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const Spacer(),
                Text(
                  "Lihat semua",
                  style: purpleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardHistory(),
                cardHistory(),
              ],
            ),
          ],
        );
      }

      Widget consultationSection() {
        return Column(
          children: [
            Text(
              "Janji Konsultasi Anda",
              style: purpleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/consultation/icon-empty.png",
              width: double.infinity,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Belom ada\njanji yang kamu buat",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CalendarScreen();
                  }));
                },
                color: kPrimaryColor,
                text: "Ayo buat janji",
                textColor: kWhiteColor,
                width: 170,
              ),
            ),
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            historySection(),
            const SizedBox(
              height: 40,
            ),
            consultationSection(),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              "Jadwalkan Konsultasi",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            header(),
            profile(),
            consultationContent(),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}