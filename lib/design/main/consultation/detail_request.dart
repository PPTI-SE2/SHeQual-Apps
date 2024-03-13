import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shequal/design/main/consultation/pilih_pembayaran.dart';
import 'package:shequal/design/main/main_screen.dart';
import 'package:shequal/models/appoiment_model.dart';
import 'package:shequal/services/appoiment_service.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class DetailRequest extends StatefulWidget {
  final AppoimentModel appoimentModel;
  final UserPreferencesManager userPreferencesManager;
  const DetailRequest({super.key, required this.appoimentModel, required this.userPreferencesManager});

  @override
  State<DetailRequest> createState() => _DetailConsultantState();
}

class _DetailConsultantState extends State<DetailRequest> {
  String convertDate() {
    String timestamp = widget.appoimentModel.date.toString();
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate; // Output: 16 Mei 2024
  }
  String getDayOfWeek(String dateString) {
  initializeDateFormatting('id', null);
  DateTime date = DateTime.parse(dateString);
  String dayOfWeek = DateFormat('EEEE', 'id').format(date);
  return dayOfWeek;
}
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
                        "Dr. ${widget.appoimentModel.consultant}",
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
                          color: (widget.appoimentModel.status == "pending") ? const Color(0xffFFA235) : (widget.appoimentModel.status == "accept") ? kGreenColor : (widget.appoimentModel.status == "cancelled") ? kRedColor : kPrimaryColor,
                        ),
                        child: Center(
                          child: Icon(
                            (widget.appoimentModel.status == "pending") ? Icons.access_time : (widget.appoimentModel.status == "accept") ? Icons.check : (widget.appoimentModel.status == "cancelled") ? Icons.close : Icons.check,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Text(
                        (widget.appoimentModel.status! == "pending") ?
                        "Menunggu Konfirmasi" : (widget.appoimentModel.status == "accept") ?
                        "Permintaan Konsultasi\nDiterima" : "Appoiment berhasil dibayar",
                        style: blackTextStyle.copyWith(
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
                            Text(getDayOfWeek(widget.appoimentModel.date.toString()), style: purpleTextStyle.copyWith(
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
                            Text(convertDate(), style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Waktu", style: blackTextStyle,),
                            Text("${widget.appoimentModel.time} WIB", style: blackTextStyle.copyWith(
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
                    (widget.appoimentModel.status == "accept") ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PilihPembayaran(appoimentModel: widget.appoimentModel, userPreferencesManager: widget.userPreferencesManager,)));
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
                          onPressed: () async {
                            bool isSuccess = await AppoimentService().cancelAppoiment(appointmentId: widget.appoimentModel.id.toString());
                            if(isSuccess) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(userPreferencesManager: widget.userPreferencesManager)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: kRedColor,
                                content: Text("Gagal Membatalkan Appoiment"),
                              ));
                            }
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
                    ) : (widget.appoimentModel.status == "bayar") ?
                    waktuPembayaran() : const SizedBox()
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
