import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class SuccessConsultation extends StatefulWidget {
  bool isRequest;
  SuccessConsultation({super.key, this.isRequest = true});

  @override
  State<SuccessConsultation> createState() => _SuccessConsultationState();
}

class _SuccessConsultationState extends State<SuccessConsultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/succes.json", width: 200, height: 200),
            const SizedBox(height: 50,),
            Text(widget.isRequest ? "Permintaan berhasil dikirimkan" : "Pembayaran berhasil", style: blackTextStyle.copyWith(
              fontSize: 18, fontWeight: semiBold,
            ),),
            CustomButton(
                      onPressed: () {
                        Provider.of<PageProviders>(context, listen: false).setIndex(2);
                        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false);
                      },
                      color: kPrimaryColor,
                      text: "Kembali",
                      textColor: kWhiteColor,
                      width: 150,
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                    ),
          ],
        ),
      )
    );
  }
}