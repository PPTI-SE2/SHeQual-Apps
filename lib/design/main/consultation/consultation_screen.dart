import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/design/main/consultation/calendar_screen.dart';
import 'package:shequal/design/main/consultation/detail_request.dart';
import 'package:shequal/models/appoiment_model.dart';
import 'package:shequal/providers/appoiment_providers.dart';
import 'package:shequal/services/appoiment_service.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class ConsultationScreen extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  const ConsultationScreen({super.key, required this.userPreferencesManager});

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
          const SizedBox(height: 20,),
          // Text(
          //   widget.userPreferencesManager.getUser()!.username.toString(),
          //   style: blackTextStyle.copyWith(
          //     fontSize: 18,
          //     fontWeight: medium,
          //   ),
          // ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreyColor,
              image: DecorationImage(
                image: AssetImage(
                  "assets/home/profile.png"
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
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
                  widget.userPreferencesManager.getUser()!.poin.toString() + " Poin",
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
        Widget empty() {
          return Column(
            children: [
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
            ],
          );
        }

        Widget cardConsultation(AppoimentModel appoimentModel) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(18),
              color: kWhiteColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (appoimentModel.status == "pending") ? const Color(0xffFFA235) : (appoimentModel.status == "accept" && appoimentModel.isBayar != 1) ? kGreenColor : (appoimentModel.status == "cancelled") ? kRedColor : kPrimaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      (appoimentModel.status == "pending") ? Icons.access_time : (appoimentModel.status == "cancelled") ? Icons.close : Icons.check, 
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${appoimentModel.consultant}",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Biopsychologis",
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () async {
                    bool isBayar = await AppoimentService().isBayar(appointmentId: appoimentModel.id.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailRequest(
                        appoimentModel: appoimentModel, 
                        userPreferencesManager: widget.userPreferencesManager,
                        isBayar: isBayar,
                      );
                    }));
                  }, 
                  color: kPrimaryColor, 
                  text: "Lihat", 
                  textColor: kWhiteColor, 
                  width: 80,
                ),
              ],
            ),
          );
        }

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
            FutureBuilder(
              future: Provider.of<AppoimentProviders>(context, listen: false).getAppoimentByUserId(userId: widget.userPreferencesManager.getUser()!.id.toString()), 
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  if(Provider.of<AppoimentProviders>(context, listen: false).appoiments.isEmpty) {
                    return empty();
                  } else {
                    return Column(
                      children: Provider.of<AppoimentProviders>(context, listen: false).appoiments.map((e) => cardConsultation(e!)).toList(),
                    );
                  }
                }
                  return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CalendarScreen(
                        userPreferencesManager: widget.userPreferencesManager,
                      );
                    }));
                  },
                  color: kPrimaryColor,
                  text: "Ayo buat janji",
                  textColor: kWhiteColor,
                  width: 170,
                ),
              ),
            // empty(),
            // cardConsultation()
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
            // header(),
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
