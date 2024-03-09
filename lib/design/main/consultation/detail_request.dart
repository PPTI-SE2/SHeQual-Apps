import 'package:flutter/material.dart';
import 'package:shequal/design/main/consultation/pilih_pembayaran.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class DetailRequest extends StatefulWidget {
  const DetailRequest({super.key});

  @override
  State<DetailRequest> createState() => _DetailConsultantState();
}

class _DetailConsultantState extends State<DetailRequest> {
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
        Widget waktuPembayaran() {
          return Column(
            children: [
              const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Kode Konsultasi", style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16
                        ),),
                        Text("KSL10203040", style: purpleTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Waktu Diterima", style: blackTextStyle),
                        Text("23/02/2024 14.33", style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Waktu Bayar", style: blackTextStyle),
                        Text("23/02/2024 14.33", style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),),
                      ],
                    ),
                    const SizedBox(height: 5,),
            ],
          );
        }

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
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kGreenColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Text("Permintaan Konsultasi\nDiterima", style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ), textAlign: TextAlign.center,),
                    ),
                    const SizedBox(height: 40,),
                    Text(
                      "Jadwal Konsultasi",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hari", style: blackTextStyle,),
                            Text("Sabtu", style: purpleTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 18,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tanggal", style: blackTextStyle,),
                            Text("24 Februari 2024", style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Waktu", style: blackTextStyle,),
                            Text("16.00 - 17.30 WIB", style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Biaya Konsul", style: blackTextStyle.copyWith(
                            ),),
                            Text("Rp 50,000", style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Biaya admin", style: blackTextStyle.copyWith(
                            ),),
                            Text("Rp 2,000", style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                            Text("Rp 52,000", style: purpleTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    
                    // waktuPembayaran(),
                    // NOTE: STATE: Bayar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PilihPembayaran()));
                          },
                          color: kPrimaryColor,
                          text: "Bayar",
                          textColor: kWhiteColor,
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: kRedColor,
                          text: "Batalkan",
                          textColor: kWhiteColor,
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                        ),
                      ],
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
