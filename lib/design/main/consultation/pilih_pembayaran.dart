import 'package:flutter/material.dart';
import 'package:shequal/design/main/consultation/success_consultation.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class PilihPembayaran extends StatefulWidget {
  const PilihPembayaran({super.key});

  @override
  State<PilihPembayaran> createState() => _PilihPembayaranState();
}

class _PilihPembayaranState extends State<PilihPembayaran> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              ),
            ),
            Expanded(
              child: Center(
                  child: Text(
                'Pilih Pembayaran',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              )),
            ),
          ],
        ),
      );
    }

    Widget poinCard() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/consultation/icon-gift.png",
              width: 30,
              height: 30,
              color: kBlackColor,
            ),
            const SizedBox(width: 5),
            Text(
              "Gunakan Poin",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: kInactiveColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "135",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ),
            const Spacer(),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              inactiveTrackColor: kInactiveColor.withOpacity(0.5),
              inactiveThumbColor: kGreyColor,
              activeTrackColor: kPrimaryColor.withOpacity(0.5),
              activeColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget buttonBayar() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text("Total bayar : ", style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),),
                const Spacer(),
                Text("Rp 52,000", style: purpleTextStyle.copyWith(
                  fontWeight: semiBold,
                  decoration: (isSwitched) ? TextDecoration.lineThrough : TextDecoration.none
                ),
                ),
                SizedBox(width: (isSwitched) ? 5 : 0),
                (isSwitched) ? Text("Free", style: blackTextStyle.copyWith(
                  fontWeight: semiBold
                ),) : const SizedBox()
              ],
            ),
            const SizedBox(height: 20,),
            CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessConsultation(isRequest: false)));
                },
                color: kPrimaryColor,
                text: "Bayar",
                textColor: kWhiteColor,
                width: double.infinity,
                
              ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
            children: [
              header(),
              poinCard(),
              const Spacer(),
              buttonBayar(),
            ],
        ),
      ),
    );
  }
}
