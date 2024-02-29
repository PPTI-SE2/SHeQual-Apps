import 'package:flutter/material.dart';
import 'package:shequal/design/main/consultation/success_consultation.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class DetailConsultant extends StatefulWidget {
  const DetailConsultant({super.key});

  @override
  State<DetailConsultant> createState() => _DetailConsultantState();
}

class _DetailConsultantState extends State<DetailConsultant> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: kBlackColor),
            ),
          ],
        ),
      );
    }

    Widget profileConsultant() {
      Widget customShadow() {
        return Container(
          width: double.infinity,
          height: 215,
          margin: const EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ],
            ),
          ),
        );
      }

      Widget detail() {
        return Container(
          margin: const EdgeInsets.only(top: 320),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Stella Kane",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "Biopsychologists",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFA235),
                        size: 24,
                      ),
                      Text(
                        "4.8",
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                ],
              ),
              // NOTE: DESCRIPTION
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tentang Konsultan",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      """Lorem ipsum dolor sit amet, ut labore et dolore magna aliqua. exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                      """,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.justify,
                    ),

                    // NOTE: Date
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kAvailableColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffC6B9FB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "26\nMAR",
                              style: purpleTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Konsultasi",
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                "Minggu 16.00 - 20.00",
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessConsultation()));
                      },
                      color: kPrimaryColor,
                      text: "Kirim Permintaan",
                      textColor: kWhiteColor,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/consultation/doctor.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            customShadow(),
            detail()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              profileConsultant(),
              title(),
            ],
          ),
        ),
      ),
    );
  }
}